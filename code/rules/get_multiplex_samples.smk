rule get_multiplex_samples:
    input:
        db="../primary/oka-population_epigenetics.db",
        sql="../../code/scripts/get_multiplex_samples.sql"
    output:
        "../primary/multiplex_samples.csv"
    shell:
        "sqlite3 -header -csv {input.db} < {input.sql} > {output}"
