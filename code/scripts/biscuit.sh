biscuit index TAIR10.fasta
biscuit align -t 4 -C ../data/arabidopsis_thaliana/genome_assembly/TAIR10.fasta data/test/test-line_A-R1.classified.qc.fastq data/test/test-line_A-R2.classified.qc.fastq > data/test/test-line_A.mapped.sam
samtools sort -T . -O bam -o output.bam data/test/test-line_A.mapped.sam
samtools index output.bam
samtools flagstat output.bam >output.bam.flagstat # do this after markdup !!!
biscuit markdup output.bam output.markdup.bam
samtools index output.markdup.bam
biscuit pileup ../data/arabidopsis_thaliana/genome_assembly/TAIR10.fasta output.bam -o output.vcf -q 20
bgzip output.vcf
tabix -p vcf output.vcf.gz
biscuit vcf2bed -k 10 -t c output.vcf.gz > output.c.bed
biscuit vcf2bed -k 10 -t snp output.vcf.gz > output.snp.bed
# doing alignment on the whole lineage and adding read groups afterwards with samtools reheader...
# avoids splitting!!
# Alfred & Picard can be used afterwards as they are read group aware!!
cat <(samtools view -H lineage-A.mapped.bam) <(samtools view -H lineage-A_demux.cram | grep -v ^@HD) | samtools reheader - lineage-A.mapped.bam > lineage-A.mapped.h.bam