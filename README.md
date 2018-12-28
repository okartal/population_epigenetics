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
        snakemake -pj --use-conda --snakefile ../Snakefile
        ```
- To run the pipeline on real data:

    1. Set up a project directory similar to test/ with its own proper config.yaml file.
    2. Ensure that the pop-epi environment is active.
    3. Run the pipeline:
        ```sh
        cd test/
        snakemake -pj --use-conda --snakefile <path/to/Snakefile>
        ```
