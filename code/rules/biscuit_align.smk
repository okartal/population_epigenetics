rule biscuit_align:
    input:
        ubam="{unit}/{readgroup}_unmapped.bam",
        ref=config["data"]["reference_genome"]
    output:
        metrics="{unit}/{readgroup}_adapter_metrics.txt",
        bam=protected("{unit}/{readgroup}_mapped.bam")
    params:
        samtofastq="CLIPPING_ATTRIBUTE=XT CLIPPING_ACTION=2 INTERLEAVE=true NON_PF=true",
        biscuit="-p -M",
        sortqn="SORT_ORDER=queryname",
        merge="CREATE_INDEX=true ADD_MATE_CIGAR=true CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 PRIMARY_ALIGNMENT_STRATEGY=BestMapq ATTRIBUTES_TO_RETAIN=XA ATTRIBUTES_TO_RETAIN=XB ATTRIBUTES_TO_RETAIN=ZC ATTRIBUTES_TO_RETAIN=ZR ATTRIBUTES_TO_RETAIN=XS ATTRIBUTES_TO_RETAIN=YD TMP_DIR=/tmp/ IS_BISULFITE_SEQUENCE=true",
        sortco="SORT_ORDER=coordinate"
    threads:
        config["threads"]["biscuit_align"]
    shell:
        "picard MarkIlluminaAdapters I={input.ubam} O=/dev/stdout M={output.metrics}"
        " | picard SamToFastq {params.samtofastq} I=/dev/stdin FASTQ=/dev/stdout"
        " | biscuit align {params.biscuit} -t {threads} {input.ref} /dev/stdin"
        " | picard SortSam {params.sortqn} I=/dev/stdin O=/dev/stdout"
        " | picard ReorderSam R={input.ref} I=/dev/stdin O=/dev/stdout"
        " | picard MergeBamAlignment {params.merge} R={input.ref}"
        " UNMAPPED_BAM={input.ubam} ALIGNED_BAM=/dev/stdin O=/dev/stdout"
        " | biscuit markdup /dev/stdin /dev/stdout"
        " | picard SortSam {params.sortco} I=/dev/stdin O={output.bam}"
