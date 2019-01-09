rule samtools_index_post:
    input:
        "{unit}_mapped.mkdup.bam"
    output:
        "{unit}_mapped.mkdup.bam.bai"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools index -@ {threads} {input} {output}"