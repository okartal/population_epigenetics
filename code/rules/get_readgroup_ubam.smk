rule get_readgroup_ubam:
    input:
        "{unit}_demux.cram"
    output:
        temp("{unit}/{readgroup_name}_unmapped.bam")
    threads:
        config["threads"]["samtools"]
    params:
        view="-b -h",
        rg=lambda wildcards: readgroups.id[wildcards.readgroup_name],
        sort="SORT_ORDER=queryname " + config["params"]["picard_tmpdir"]
    shell:
        "samtools view {params.view} -r {params.rg} -@ {threads} {input}"
        " | picard SortSam {params.sort} I=/dev/stdin O={output}"
        
