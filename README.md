# Mathematical Modeling of Population Epigenetics

The aim of the project is to estimate the probability of gain and loss of DNA
methylation variants across generations. To this end, we use probabilistic
modeling and bisulfite-sequencing data.

## Prerequisites

- conda (miniconda3 or anaconda3)
- snakemake

## Instructions

1. Download test data into test folder from [here](https://drive.google.com/drive/folders/1fwSfb71eED2ob0gJghPfNgHsuUTsTAJt).
2. In the folder containing the config.yaml file (e.g. test/), run the following command:
```sh
$ snakemake -pj --use-conda --snakefile <path/to/Snakefile>
