rule picard_samtofastq:
    input:
        "{unit}/{readgroup}_markadapt.bam"
    output:
        fq1=temp("{unit}/{readgroup}_1.fastq"),
        fq2=temp("{unit}/{readgroup}_2.fastq")
    params:
        "CLIPPING_ATTRIBUTE=XT CLIPPING_ACTION=2 INCLUDE_NON_PF_READS=true TMP_DIR=/data/home/oender/tmp/"
    shell:
        "picard SamToFastq {params} I={input}"
        " FASTQ={output.fq1} SECOND_END_FASTQ={output.fq2}"
