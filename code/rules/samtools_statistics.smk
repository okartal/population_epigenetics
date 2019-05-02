rule samtools_stats:
    input:
        bam="{unit}/{readgroup}_mapped.bam",
        ref=config["data"]["reference_genome"]
    output:
        "{unit}/{readgroup}_mapped.stats"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools stats -@ {threads} --ref-seq {input.ref}"
        " {input.bam} > {output}"

rule samtools_flagstats:
    input:
        "{unit}/{readgroup}_mapped.bam"
    output:
        "{unit}/{readgroup}_mapped.flagstats"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools flagstat -@ {threads} {input} > {output}"
        
rule samtools_idxstats:
    input:
        "{unit}/{readgroup}_mapped.bam"
    output:
        "{unit}/{readgroup}_mapped.idxstats"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools idxstats -@ {threads} {input} > {output}"

