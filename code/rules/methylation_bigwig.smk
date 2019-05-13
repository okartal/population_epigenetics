rule methylation_bedgraph:
    input:
        "{unit}/{readgroup}_smp.bed.gz"
    output:
        temp("{unit}/{readgroup}_{context}-meth.bedgraph")
    shell:
        "zcat {input}"
        " | awk '$5==\"{wildcards.context}\"'"
        " | cut -f1-3,8"
        " > {output}"

rule methylation_bigwig:
    input:
        bedgraph="{unit}/{readgroup}_{context}-meth.bedgraph",
        size=config["data"]["reference_genome_size"]
    output:
        "{unit}/{readgroup}_{context}-meth.bw"
    shell:
        "bedGraphToBigWig {input.bedgraph} {input.size} {output}"

