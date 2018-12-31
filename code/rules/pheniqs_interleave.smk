rule pheniqs_interleave:
    """Interleave read segments into a single CRAM file.
    """
    input:
        units=config["data"]["multiplex"]["units"]
    output:
        "data/{unit}.cram"
    threads:
        config["threads"]["pheniqs"]
    run:
        cmd = "pheniqs mux -t {threads} -o {output} "
        units = pd.read_csv(input.units, index_col="id")
        reads = units.loc[
            wildcards.unit, config["params"]["pheniqs"]["interleave"]]
        input_stream = " ".join(["-i {}".format(i) for i in reads])
        shell(cmd + input_stream)
