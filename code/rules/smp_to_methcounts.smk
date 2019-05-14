rule smp_to_methcounts:
    input:
        "{unit}/{readgroup}_smp.bed.gz"
    output:
        "{unit}/{readgroup}_{context}.meth"
    shell:
        "gunzip -c -d {input}"
        "| awk '{{OFS=\"\\t\"}} {{if ($5==\"{wildcards.context}\") {{"
        "  gsub(\"C\",\"+\", $4); gsub(\"G\",\"-\", $4); gsub(\"CG\",\"CpG\", $5);"
        "  print $1,$2,$4,$5,$8,$9}} }}'"
        " > {output}"
