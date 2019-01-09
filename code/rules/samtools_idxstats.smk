rule samtools_idxstats:
    input:
        "{unit}_mapped.mkdup.bam"
    output:
        "{unit}_mapped.mkdup.idxstats.txt"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools idxstats -@ {threads} {input} > {output}"