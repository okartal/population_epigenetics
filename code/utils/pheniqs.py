# Pheniqs helper module
import pandas as pd

def csv2codec(multiplex_samples):
    """Convert multiplex sample table into pheniqs-compliant dictionary.
    """
    codec_table = pd.read_csv(multiplex_samples, header=0)
    codec_table["codename"] = "@" + codec_table.barcode
    codec_table["barcode"] = codec_table.barcode.map(lambda seq: [seq])
    return codec_table.set_index(["codename"]).transpose().to_dict()