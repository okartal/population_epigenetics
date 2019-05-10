rule biscuit_markdup:
    input:
        bam="{unit}/{readgroup}_merged.bam",
        bai="{unit}/{readgroup}_merged.bai"
    output:
        temp("{unit}/{readgroup}_markdup.bam")
    params:
        "-q"
    shell:
        "biscuit markdup {params} {input.bam} {output}"
