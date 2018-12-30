rule pheniqs_interleave:
    """Interleave read segments into a single CRAM file.
    """
    input:
        "data/{unit}_interleave_config.json"
    output:
        "data/{unit}.cram"
    threads:
        config["threads"]["pheniqs"]
    shell:
        "pheniqs mux --config {input}"