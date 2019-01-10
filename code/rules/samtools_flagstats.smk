rule samtools_flagstats:
    input:
        "{unit}_mapped_mkdup.bam"
    output:
        "{unit}_mapped_mkdup.flagstats"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools flagstat -@ {threads} {input} > {output}"
