rule samtools_index_pre:
    input:
        "{unit}_mapped.bam"
    output:
        "{unit}_mapped.bam.bai"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools index -@ {threads} {input} {output}"