# Pheniqs helper module
import numpy as np
import pandas as pd

def default(object_):
    """Function to avoid bug in serializing numpy.int64
    see https://stackoverflow.com/a/50577730/2136626
    """
    if isinstance(object_, np.int64):
        return int(object_)  
    raise TypeError

def codec_dict(codec_table):
    """Convert codec table into pheniqs-compliant dictionary.
    """
    codec_table["codename"] = "@" + codec_table["barcode"]
    codec_table["barcode"] = codec_table.barcode.map(lambda seq: [seq])
    return codec_table.set_index(["codename"]).transpose().to_dict()
