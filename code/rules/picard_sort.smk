rule picard_sort:
    input:
        sam="{unit}/{readgroup}_unmerged_unordered_unsorted.sam"
    output:
        sam=temp("{unit}/{readgroup}_unmerged_unordered.sam")
    params:
        "SORT_ORDER=queryname " + config["params"]["picard_tmpdir"]
    shell:
        "picard SortSam {params} I={input.sam} O={output.sam}"
