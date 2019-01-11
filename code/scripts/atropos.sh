atropos trim \
-e RATE \ # consider estimating the error rate using atropos error, then set -e to the 10-fold of the estimated error rate, see docs
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
--bisulfite truseq \
--op-order GAWCQ \ # recommended, see docs
--merge-overlapping \ # to avoid double-counting
--overwrite-low-quality LOWQ,HIGHQ,WINDOW \ # to alleviate problems with read2
--merged-output FILE_FASTQ\ # to not discard merged reads but map them as single-end fastq
--stats both \ # for stats before and after
--report-file FILE_JSON \
--threads THREADS \
--no-writer-process \ # write to separate files?
-l test.sam # takes a demultiplexed interleaved sam file
# for TruSeqLT adapter trimming:
# see https://support.illumina.com/bulletins/2016/12/what-sequences-do-i-use-for-adapter-trimming.html
#
# working example:
atropos trim -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --bisulfite truseq --op-order GAWCQ --stats both --report-file data/test/test-line_A.qc.json --threads 4 -o data/test/test-line_A-R1.classified.qc.fastq -p data/test/test-line_A-R2.classified.qc.fastq -pe1 data/test/test-line_A-R1.classified.fastq -pe2 data/test/test-line_A-R2.classified.fastq
# note: think about removing reads < 80 bp after trimming, bwameth gives
# WARNING: 1709 reads with length < 80
#        : this program is designed for long reads