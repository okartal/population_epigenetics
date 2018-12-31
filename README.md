# Mathematical Modeling of Population Epigenetics

The aim of the project is to estimate the probability of gain and loss of DNA methylation variants across generations. To this end, we use probabilistic modeling and bisulfite-sequencing data.

## Prerequisites

- conda (miniconda3 or anaconda3)

## Instructions

- To make a local copy ready to run, do the following steps only once:
    ```sh
    git clone git@github.com:okartal/population_epigenetics.git
    cd population_epigenetics
    conda-env create -f requirements.yaml
    ```
- To run the pipeline on test data:

    1. Download the test data folder from [here](https://drive.google.com/drive/folders/1fwSfb71eED2ob0gJghPfNgHsuUTsTAJt) and move it into `test/`.
    2. Activate the pop-epi conda environment:
        ```sh
        conda activate pop-epi
        ```
    3. Run the test:
        ```sh
        cd test/
        snakemake -pj --use-conda --snakefile ../code/Snakefile
        ```
- To run the pipeline on real data:

    1. Set up a project folder similar to test/, that has the following files:
        ```
        config.yaml
        data/multiplex_units.csv
        data/multiplex_samples.csv
        data/<read_files>
        ```
        You need to adapt the data in the CSV files. In the config file, you may change the params and threads according to your needs. **However, do not change the data fields, that would break the workflow!**
    2. Ensure that the pop-epi environment is active.
    3. Run the pipeline:
        ```sh
        cd <your/project/folder>/
        snakemake -pj --use-conda --snakefile <path/to/Snakefile/from/this/repo>
        ```
