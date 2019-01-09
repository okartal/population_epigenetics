rule samtools_stats:
    input:
        bam="{unit}_mapped.mkdup.bam",
        ref=DATA["reference_genome"]
    output:
        "{unit}_mapped.mkdup.stats.txt"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools stats -@ {threads} --ref-seq {input.ref}"
        " {input.bam} > {output}"