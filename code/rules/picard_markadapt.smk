rule picard_markadapt:
    input:
        "{unit}/{readgroup}_unmapped.bam"
    output:
        bam=temp("{unit}/{readgroup}_markadapt.bam"),
        metrics="{unit}/{readgroup}_adapter_metrics.txt"
    params:
        config["params"]["picard_tmpdir"]
    shell:
        "picard MarkIlluminaAdapters {params}"
        " I={input} O={output.bam} M={output.metrics}"
