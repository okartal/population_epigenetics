biscuit pileup ../data/arabidopsis_thaliana/genome_assembly/TAIR10.fasta output.bam -o output.vcf -q 20
bgzip output.vcf
tabix -p vcf output.vcf.gz
biscuit vcf2bed -k 10 -t c output.vcf.gz > output.c.bed
biscuit vcf2bed -k 10 -t snp output.vcf.gz > output.snp.bed
