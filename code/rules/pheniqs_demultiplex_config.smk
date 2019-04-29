rule pheniqs_demultiplex_config:
    """Make pheniqs config file for demultiplexing reads.
    """
    input:
        reads="{unit}_inter.cram",
        samples=config["data"]["multiplex_samples"]
    output:
        json="{unit}_demux_config.json"
    run:
        demux_config = config["params"]["pheniqs_demultiplex"]
        
        demux_input = config["params"]["pheniqs_interleave"]

        demux_config["input"] = [input.reads] * len(demux_input)
        
        codec_table = (
            pd.read_csv(input.samples, index_col="unit-id").loc[wildcards.unit]
        )

        demux_config["multiplex"]["codec"] = pheniqs.codec_dict(codec_table)
        
        other_columns = sorted(set(units.columns) - set(demux_input))

        unit_configuration = units.loc[wildcards.unit, other_columns].to_dict()
        
        demux_config.update(unit_configuration)

        with open(output.json, "w") as outfile:
            json.dump(demux_config, outfile, indent=4, default=pheniqs.default)
