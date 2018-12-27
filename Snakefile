import pandas as pd

configfile: "config.yaml"

units = pd.read_csv(config["data"]["multiplex"]["units"], index_col="id")

rule end:
    input:
        expand(
            "data/{unit}_interleave_config.json",
            unit=units.index.values
        ),
        expand(
            "data/{unit}.cram",
            unit=units.index.values
        )

include: "code/rules/pheniqs_interleave_config.smk"
include: "code/rules/pheniqs_interleave.smk"