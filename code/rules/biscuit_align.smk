rule biscuit_align:
    input:
        fq1="{unit}/{readgroup}_1.fastq",
        fq2="{unit}/{readgroup}_2.fastq",
        ref=config["data"]["reference_genome"]
    output:
        sam=temp("{unit}/{readgroup}_unmerged_unordered_unsorted.sam")
    params:
        "-M"
    threads:
        config["threads"]["biscuit_align"]
    shell:
        " biscuit align {params} -t {threads} {input.ref}"
        " {input.fq1} {input.fq2} > {output.sam}"

