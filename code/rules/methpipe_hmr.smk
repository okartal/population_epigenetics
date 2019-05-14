rule methpipe_hmr:
    input:
        "{unit}/{readgroup}_{context}.meth"
    output:
        "{unit}/{readgroup}_{context}_HMR.bed"
    shell:
        "awk '{{OFS=\"\\t\"}} {{$5=1-$5; print $0}}' {input}"
        " | hmr /dev/stdin"
        " | sed 's/HYPO/HMR:/g'"
        " > {output}"
        
rule methpipe_composite_hmr:
    input:
        "{unit}/{readgroup}_{context}.meth"
    output:
        "{unit}/{readgroup}_{context}_cHMR.bed"
    shell:
        "hypermr {input} | sed 's/hyper/cHMR/g' > {output}"

rule hmr_bedgtrack:
    """Strand and name are not informative in HMR BED6. Make a proper
    track.
    """
    input:
        "{unit}/{readgroup}_{context}_{mregion}.bed"
    output:
        "{unit}/{readgroup}_{context}_{mregion}.bedgraph"
    params:
        lambda wildcards: genomics.track_definition(
            tracktype="bedGraph",
            tlabel=readgroups.loc[wildcards.readgroup]["SM"],
            clabel="-".join([wildcards.context, wildcards.mregion]),
            color=config["colormap"]["context"][wildcards.context],
            hex=True
        )
    shell:
        "echo -e '{params}' >> {output};"
        "cut -f1-3,5 {input} >> {output}"

