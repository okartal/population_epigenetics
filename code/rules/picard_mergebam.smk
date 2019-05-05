rule picard_mergebam:
    input:
        ubam="{unit}/{readgroup}_unmapped.bam",
        mbam="{unit}/{readgroup}_unmerged.sam",
        ref=config["data"]["reference_genome"]
    output:
        bam=protected("{unit}/{readgroup}_mapped.bam")
    params:
        merge="CREATE_INDEX=true ADD_MATE_CIGAR=true CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 PRIMARY_ALIGNMENT_STRATEGY=BestMapq ATTRIBUTES_TO_RETAIN=XA ATTRIBUTES_TO_RETAIN=XB ATTRIBUTES_TO_RETAIN=ZC ATTRIBUTES_TO_RETAIN=ZR ATTRIBUTES_TO_RETAIN=XS ATTRIBUTES_TO_RETAIN=YD IS_BISULFITE_SEQUENCE=true " + config["params"]["picard_tmpdir"],
        sort="SORT_ORDER=coordinate " + config["params"]["picard_tmpdir"],
        markdup="-q"
    shell:
        " picard MergeBamAlignment {params.merge} R={input.ref} UNMAPPED_BAM={input.ubam} ALIGNED_BAM={input.mbam} O=/dev/stdout"
        " | biscuit markdup {params.markdup} /dev/stdin /dev/stdout"
        " | picard SortSam {params.sort} I=/dev/stdin O={output.bam}"
