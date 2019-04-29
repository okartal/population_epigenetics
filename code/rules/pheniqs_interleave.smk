rule pheniqs_interleave:
    """Interleave read segments into a single CRAM file.
    """
    input:
        fq=lambda wildcards: units.loc[
                wildcards.unit,
                config["params"]["pheniqs_interleave"]
            ]
    output:
        protected("{unit}_inter.cram")
    threads:
        config["threads"]["pheniqs"]
    run:
        cmd = "pheniqs mux -t {{threads}} -o {{output}} {input}"

        shell(
            cmd.format(input=" ".join("-i " + i for i in input.fq))
        )
