rule biscuit_markdup:
    input:
        "{unit}/{readgroup}_merded.bam"
    output:
        temp("{unit}/{readgroup}_markdup.bam")
    params:
        "-q"
    shell:
        "biscuit markdup {params} {input} {output}"
