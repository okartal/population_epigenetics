rule alfred_qc:
    input:
        bam="{unit}_mapped.mkdup.bam",
        ref=DATA["reference_genome"]
    output:
        "{unit}_mapped.mkdup.qc.json.gz"
    shell:
        "alfred qc -r {input.ref} -j {output} {input.bam}"
