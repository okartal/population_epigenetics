rule samtools_sort:
    input:
        "{unit}_mapped_mkdup_unsorted.bam"
    output:
        "{unit}_mapped_mkdup.bam"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools sort -@ {threads} -O BAM {input} > {output}"