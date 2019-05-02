rule samtools_index:
    input:
        "{unit}/{readgroup}_mapped.bam"
    output:
        "{unit}/{readgroup}_mapped.bam.bai"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools index -@ {threads} {input} {output}"
