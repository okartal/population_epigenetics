bwameth.py index ../data/arabidopsis_thaliana/genome_assembly/TAIR10.fasta
bwameth.py --reference ../data/arabidopsis_thaliana/genome_assembly/TAIR10.fasta -t 4 \
data/test/test-line_A-R1.classified.qc.fastq \
data/test/test-line_A-R2.classified.qc.fastq > data/test/test-line_A.mapped.sam 2>
