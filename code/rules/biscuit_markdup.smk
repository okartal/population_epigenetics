rule biscuit_markdup:
    input:
        "{unit}_mapped.bam"
    output:
        "{unit}_mapped.mkdup.unsorted.bam"
    shell:
        "biscuit markdup {input} {output}"
    