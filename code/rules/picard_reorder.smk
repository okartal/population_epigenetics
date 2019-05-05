rule picard_reorder:
    input:
        sam="{unit}/{readgroup}_unmerged_unordered.sam",
        ref=config["data"]["reference_genome"]
    output:
        sam=temp("{unit}/{readgroup}_unmerged.sam")
    params:
        config["params"]["picard_tmpdir"]
    shell:
        "picard ReorderSam {params} R={input.ref} I={input.sam} O={output.sam}"
