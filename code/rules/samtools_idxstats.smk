rule samtools_idxstats:
    input:
        "{unit}_mapped_mkdup.bam"
    output:
        "{unit}_mapped_mkdup.idxstats"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools idxstats -@ {threads} {input} > {output}"