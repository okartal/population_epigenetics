import json

rule pheniqs_interleave_config:
    """Make pheniqs config file for interleaving reads.
    """
    input:
        lambda wildcards: units.loc[wildcards.unit, "index read1 read2".split()]
    output:
        config="data/{unit}_interleave_config.json"
    run:
        config = dict()
        config["input"] = input
        config["output"] = ["data/{}.cram".format(wildcards.unit)]
        with open(output.config, "w") as configfile:
            json.dump(config, configfile, indent=4)