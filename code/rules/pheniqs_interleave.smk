rule pheniqs_interleave:
    input:
        "data/{unit}_interleave_config.json"
    output:
        "data/{unit}.cram"
    conda:
        "../../requirements.yaml"
    shell:
        "pheniqs mux --config {input}"