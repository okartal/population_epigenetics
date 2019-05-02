# Helper functions for handling data input/output
import pandas as pd

def get_multiplex_data(data, sep_name="-", sep_id=":"):
    """Get multiplex samples and units.
    """
    units = pd.read_csv(data["multiplex_units"], index_col="id")
    samples = pd.read_csv(data["multiplex_samples"], index_col="SM")

    rg = pd.merge(units, samples, left_index=True, right_on="unit-id")

    for sep, col in zip((sep_name, sep_id), ("name", "id")):
        rg[col] = rg["flowcell id"].str.cat(
            rg[["flowcell lane number", "barcode"]].astype(str),
            sep=sep
        )

    rg["prefix"] = rg["unit-id"].astype(str).str.cat(rg["name"], sep="/")
    
    return units, samples, rg.reset_index().set_index(rg["name"])


