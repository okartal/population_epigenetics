for f in line_*.fastq.gz; do
    zcat $f | head -n1000000 | gzip -c > test-$f;
done