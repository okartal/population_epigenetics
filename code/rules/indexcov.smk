for f in *_mapped_mkdup.bam; do samtools split --reference ../primary/TAIR10.fasta --output-fmt BAM -f '%*_%!.%.' -@ 8 $f; done
for f in lineage-*_CB0L6ANXX\:*bam; do samtools index $f; done
goleft indexcov --directory indexcov/ lineage-*_CB0L6ANXX\:*.bam