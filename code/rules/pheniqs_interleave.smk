rule pheniqs_interleave:
    """Interleave read segments into a single CRAM file.
    """
    input:
        units=DATA["multiplex_units"]
    output:
        protected(config["data"]["dir"] + "{unit}_inter.cram")
    threads:
        config["threads"]["pheniqs"]
    run:
        cmd = "pheniqs mux -t {threads} -o {output} "

        units = pd.read_csv(input.units, index_col="id")

        input_args = " ".join(
            "-i "
            + config["data"]["dir"]
            + units.loc[
                wildcards.unit, config["params"]["pheniqs"]["interleave"]
            ]
        )

        shell(cmd + input_args)
