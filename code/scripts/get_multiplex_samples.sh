#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# get_multiplex_samples.sh
# run this from primary data directory
sqlite3 -header -csv oka-population_epigenetics.db < ../../population_epigenetics/code/get_multiplex_samples.sql > multiplex_samples.csv
