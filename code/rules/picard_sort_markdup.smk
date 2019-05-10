rule picard_sort_markdup:
    input:
        "{unit}/{readgroup}_markdup.bam"
    output:
        "{unit}/{readgroup}_mapped.bam"
    params:
        "SORT_ORDER=coordinate"
    shell:
        "picard SortSam {config[params][picard]} {params} I={input} O={output}"
