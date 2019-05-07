rule picard_markadapt:
    input:
        "{unit}/{readgroup}_unmapped.bam"
    output:
        bam=temp("{unit}/{readgroup}_markadapt.bam"),
        metrics="{unit}/{readgroup}_adapter_metrics.txt"
    shell:
        "picard MarkIlluminaAdapters {config[params][picard]}"
        " I={input} O={output.bam} M={output.metrics}"
