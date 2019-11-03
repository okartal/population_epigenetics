# Mathematical Modeling of Population Epigenetics

The aim of the project is to use Bayesian inference on a graphical model based on bisulfite-sequencing data across generations to estimate the propensity to gain or lose DNA methylation.

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

    1. Download the test data from [here](https://drive.google.com/drive/folders/1fwSfb71eED2ob0gJghPfNgHsuUTsTAJt) and move the content into `test/data/primary/`.
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

    1. Set up your project folder with the following folders and files (structure of data folder is similar to test/, you can use symbolic links in data/primary):
        ```sh
        .
        ├── data
            ├── primary
                ├── multiplex_samples.csv
                ├── multiplex_units.csv
                ├── <genome data>
            ├── results
                ├── config.yaml
        ```
    2. Adapt the CSVs and the config file params and threads directives. Set up additional results folders with their own config.yaml to store runs with different configurations. **However, do not change the data directive in the config file, that would break the workflow!**
    3. Ensure that the pop-epi environment is active.
    4. Run the pipeline from the appropriate results folder:
        ```sh
        cd <path/to/your/project/folder>/data/results_XY/
        snakemake -pj --use-conda --snakefile <path/to/Snakefile/from/this/repo>
        ```
