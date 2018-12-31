rule pheniqs_demultiplex_config:
    """Make pheniqs config file for demultiplexing reads.
    """
    input:
        reads="data/{unit}.cram",
        samples=config["data"]["multiplex"]["samples"]
    output:
        json="data/{unit}_demux_config.json"
    run:
        pheniqs_config = config["params"]["pheniqs"]["demultiplex"]
        
        input_streams = config["params"]["pheniqs"]["interleave"]

        pheniqs_config["input"] = [input.reads] * len(input_streams)
        
        pheniqs_config["output"] = [
            "data/{}.demux.cram".format(wildcards.unit)]
        
        codec_table = (pd.read_csv(input.samples, header=0)
            .groupby("unit-id")
            .get_group(wildcards.unit)
            .drop(columns=["unit-id"]))

        pheniqs_config["multiplex"]["codec"] = pheniqs.codec_dict(codec_table)
        
        fields = set(units.columns) - set(input_streams)
        
        pheniqs_config.update(
            units.loc[wildcards.unit, sorted(fields)].to_dict())

        with open(output.json, "w") as outputfile:
            json.dump(
                pheniqs_config, outputfile,indent=4, default=pheniqs.default)
