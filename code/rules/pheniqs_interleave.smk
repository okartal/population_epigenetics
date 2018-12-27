rule pheniqs_interleave:
    input:
        "data/{unit}_interleave_config.json"
    output:
        "data/{unit}.cram"
    shell:
        "pheniqs mux --config {input}"