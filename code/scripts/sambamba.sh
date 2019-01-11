sambamba view \
-f bam \
-F " not [RG] =~ /undetermined$/ " data/test/test-line_A-demultiplexed.bam \
| samtools fastq -T RG -1 r1s.fastq -2r2s.fastq -
### alternative; idea is to keep cram as long as possible
1. samtools split on pheniqs cram output to generate many cram files (maybe remove undetermined beforehand using samtools view -R)
2. samtools fastq -T RG -1 r1s.fastq -2r2s.fastq - # to copy read group
### then apply atropos, biscuit, etc on the the FASTQs (we want for example to dedup on the demultiplexed file if the tool is not read group aware!)