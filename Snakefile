import json
import pandas as pd

from code.utils import pheniqs

configfile: "config.yaml"

units = pd.read_csv(config["data"]["multiplex"]["units"], index_col="id")

rule end:
    input:
        expand(
            "data/{unit}_{variant}_config.json",
            unit=units.index.values,
            variant=["interleave", "demultiplex"]
        ),
        expand(
            "data/{unit}{variant}.cram",
            unit=units.index.values,
            variant=["", ".demux"]
        )

include: "code/rules/pheniqs_interleave_config.smk"
include: "code/rules/pheniqs_interleave.smk"
include: "code/rules/pheniqs_demultiplex_config.smk"
