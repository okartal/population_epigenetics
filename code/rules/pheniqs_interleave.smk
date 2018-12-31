rule pheniqs_interleave:
    """Interleave read segments into a single CRAM file.
    """
    input:
        lambda wildcards: units.loc[wildcards.unit, config["params"]["pheniqs"]["interleave"]]
    output:
        "data/{unit}.cram"
    threads:
        config["threads"]["pheniqs"]
    run:
        cmd = "pheniqs mux -t {threads} -o {output} "
        input_stream = ["-i {}".format(i) for i in input]
        shell(cmd + " ".join(input_stream))