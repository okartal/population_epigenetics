rule biscuit_markdup:
    input:
        "{unit}_mapped.bam"
    output:
        "{unit}_mapped_mkdup_unsorted.bam"
    shell:
        "biscuit markdup {input} {output}"
    