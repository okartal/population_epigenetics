# preprocessing.smk
# Run this prior to running the main pipeline:
# snakemake -pj --use-conda --snakefile <path/to/preprocessing.smk>

rule _:
    input:
        "../primary/multiplex_samples.csv"

rule get_multiplex_samples:
    input:
        db="../primary/oka-population_epigenetics.db",
        sql="../../code/scripts/get_multiplex_samples.sql"
    output:
        "../primary/multiplex_samples.csv"
    shell:
        "sqlite3 -header -csv {input.db} < {input.sql} > {output}"
