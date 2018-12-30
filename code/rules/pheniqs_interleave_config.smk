rule pheniqs_interleave_config:
    """Make pheniqs config file for interleaving reads.
    
    The input function gets the appropriate fastq files using the wildcard {unit}.
    """
    input:
        lambda wildcards: units.loc[wildcards.unit, config["params"]["pheniqs"]["interleave"]]
    output:
        json="data/{unit}_interleave_config.json"
    run:
        pheniqs_config = dict()
        pheniqs_config["input"] = input
        pheniqs_config["output"] = ["data/{}.cram".format(wildcards.unit)]
        with open(output.json, "w") as outputfile:
            json.dump(pheniqs_config, outputfile, indent=4)