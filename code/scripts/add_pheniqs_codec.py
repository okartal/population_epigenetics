#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import json
import sys
import pandas as pd


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        description="Adds a demultiplex codec from a table to a pheniqs config file."
    )

    parser.add_argument(
        "codec",
        type=argparse.FileType("r", encoding="UTF-8"),
        help="codec table (CSV) with header 'SM, LB, barcode'",
    )

    parser.add_argument(
        "config",
        type=argparse.FileType("r", encoding="UTF-8"),
        nargs="?",
        default=sys.stdin,
        help="configuration file to be modified (optional, default: stdin)",
    )

    args = parser.parse_args()

    # The codec table for the barcodes needs to be transformed to a dictionary
    # with special format to be added to the multiplex entry in the pheniqs
    # configuration file
    codec_table = pd.read_csv(args.codec, header=0)
    codec_table["codename"] = "@" + codec_table.barcode
    codec_table["barcode"] = codec_table.barcode.map(lambda seq: [seq])
    codec = codec_table.set_index(["codename"]).transpose().to_dict()

    config = json.load(args.config)
    config["multiplex"]["codec"] = codec

    sys.stdout.write(json.dumps(config, indent=4))
