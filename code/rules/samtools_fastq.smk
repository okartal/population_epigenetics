rule samtools_fastq:
    input:
        "{unit}_demux.cram"
    output:
        fq1="{unit}_R1.fastq",
        fq2="{unit}_R2.fastq"
    threads:
        config["threads"]["samtools"]
    params:
        config["params"]["samtools_fastq"]
    shell:
        "samtools fastq -@ {threads} {params} -1 {output.fq1} -2 {output.fq2} {input}"