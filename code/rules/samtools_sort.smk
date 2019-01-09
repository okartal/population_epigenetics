rule samtools_sort:
    input:
        "{unit}_mapped.mkdup.unsorted.bam"
    output:
        "{unit}_mapped.mkdup.bam"
    shell:
        "samtools sort -@ {threads} -O BAM {input} > {output}"