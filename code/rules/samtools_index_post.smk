rule samtools_index_post:
    input:
        "{unit}_mapped_mkdup.bam"
    output:
        "{unit}_mapped_mkdup.bam.bai"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools index -@ {threads} {input} {output}"