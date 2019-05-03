rule picard_mergebam:
    input:
        ubam="{unit}/{readgroup}_unmapped.bam",
        sam="{unit}/{readgroup}_mapped.sam"
    output:
        bam=protected("{unit}/{readgroup}_mapped.bam")
    params:
        sortqn="SORT_ORDER=queryname TMP_DIR=/data/home/oender/tmp/",
        merge="CREATE_INDEX=true ADD_MATE_CIGAR=true CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 PRIMARY_ALIGNMENT_STRATEGY=BestMapq ATTRIBUTES_TO_RETAIN=XA ATTRIBUTES_TO_RETAIN=XB ATTRIBUTES_TO_RETAIN=ZC ATTRIBUTES_TO_RETAIN=ZR ATTRIBUTES_TO_RETAIN=XS ATTRIBUTES_TO_RETAIN=YD TMP_DIR=/tmp/ IS_BISULFITE_SEQUENCE=true TMP_DIR=/data/home/oender/tmp/",
        sortco="SORT_ORDER=coordinate TMP_DIR=/data/home/oender/tmp/",
        markdup="-q"
    shell:
        " picard SortSam {params.sortqn} I={input.sam} O=/dev/stdout"
        " | picard ReorderSam R={input.ref} I=/dev/stdin O=/dev/stdout"
        " | picard MergeBamAlignment {params.merge} R={input.ref} UNMAPPED_BAM={input.ubam} ALIGNED_BAM=/dev/stdin O=/dev/stdout"
        " | biscuit markdup {params.markdup} /dev/stdin /dev/stdout"
        " | picard SortSam {params.sortco} I=/dev/stdin O={output.bam}"
