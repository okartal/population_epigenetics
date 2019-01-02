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

    1. Set up your project folder with the following folders and files (structure similar to test/):
        ```sh
        .
        ├── data
            ├── primary
                ├── multiplex_samples.csv
                ├── multiplex_units.csv
                ├── <read_files>
            ├── results_01
                ├── config.yaml
        ```
    2. Adapt the CSV and config file. Set up more results directories with adjusted config files if you want to keep results, for example for different parameter settings. **However, do not change the data fields in the config file, that would break the workflow!**
    3. Ensure that the pop-epi environment is active.
    4. Run the pipeline from the appropriate results folder:
        ```sh
        cd <path/to/your/project/folder>/data/results_XY/
        snakemake -pj --use-conda --snakefile <path/to/Snakefile/from/this/repo>
        ```
