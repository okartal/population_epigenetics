rule samtools_flagstats:
    input:
        "{unit}_mapped.mkdup.bam"
    output:
        "{unit}_mapped.mkdup.flagstats.txt"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools flagstat -@ {threads} {input} > {output}"
