rule samtools_stats:
    input:
        bam="{unit}_mapped_mkdup.bam",
        ref=DATA["reference_genome"]
    output:
        "{unit}_mapped_mkdup.stats"
    threads:
        config["threads"]["samtools"]
    shell:
        "samtools stats -@ {threads} --ref-seq {input.ref}"
        " {input.bam} > {output}"