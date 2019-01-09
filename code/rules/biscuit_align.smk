rule biscuit_align:
    input:
        fq1="{unit}_R1.fastq",
        fq2="{unit}_R2.fastq",
        ref=DATA["reference_genome"]
    output:
        "{unit}_mapped.noRG.bam"
    threads:
        config["threads"]["biscuit_align"]
    shell:
        "biscuit align -t {threads} -C {input.ref}"
        " {input.fq1} {input.fq2}"
        " | samtools sort -@ {threads} -O BAM > {output}"