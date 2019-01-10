rule samtools_reheader:
    input:
        mapped="{unit}_mapped_noRG.bam",
        demux="{unit}_demux.cram"
    output:
        "{unit}_mapped.bam"
    params:
        config["params"]["samtools_reheader"]
    shell:
        "cat"
        " <(samtools view -H {input.mapped})"
        " <(samtools view -H {input.demux} | grep -v ^@HD)"
        " | samtools reheader {params} - {input.mapped}"
        " > {output}"