rule pheniqs_demultiplex_config:
    """Make pheniqs config file for demultiplexing reads.
    """
    input:
        cram="data/{unit}.cram"
    output:
        json="data/{unit}_demultiplex_config.json"
    run:
        pheniqs_config = config["params"]["pheniqs"]["demultiplex"]
        
        input_streams = config["params"]["pheniqs"]["interleave"]

        pheniqs_config["input"] = [input.cram] * len(input_streams)
        
        pheniqs_config["output"] = [
            "data/{}.demux.cram".format(wildcards.unit)]
        
        pheniqs_config["multiplex"]["codec"] = pheniqs.csv2codec(
            config["data"]["multiplex"]["samples"])

        
        fields = set(units.columns) - set(input_streams)
        
        pheniqs_config.update(
            units.loc[wildcards.unit, sorted(fields)].to_dict())
        
        with open(output.json, "w") as outputfile:
            json.dump(pheniqs_config, outputfile, indent=4)
