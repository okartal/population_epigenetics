rule picard_sort:
    input:
        sam="{unit}/{readgroup}_unmerged_unordered_unsorted.sam"
    output:
        sam=temp("{unit}/{readgroup}_unmerged_unordered.sam")
    params:
        "SORT_ORDER=queryname"
    shell:
        "picard SortSam {config[params][picard]} {params} I={input.sam} O={output.sam}"
