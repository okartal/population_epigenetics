rule samtools_reheader:
    input:
        sam="{unit}_mapped.sam",
        cram="{unit}_demux.cram"
    output:
        "{unit}_mapped.bam"
    threads:
        config["threads"]["samtools"]
    params:
        config["params"]["samtools_reheader"]
    shell:
        "cat"
        " <(samtools view -H {input.sam})"
        " <(samtools view -H {input.cram} | grep -v ^@HD)"
        " | samtools reheader {params} - <(samtools sort -@ {threads} -O BAM {input.sam}) "
        " > {output}"