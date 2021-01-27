# COSIFER - COnSensus Interaction Network InFErence Workflow

- nextflow.config contains information regarding:

    - COSIFER [container](https://hub.docker.com/r/tsenit/cosifer) to be used.
    - Report files to be produced and their paths.

- nextflow.nf contains:

	- Definition of params accepted by the workflow.
	- Method of params accepted by the workflow on CMD:
        ```
        cosifer -i FILEPATH -o OUTPUT_DIRECTORY
        ```
        
    - Processes of the workflow.
    
        So, in recap, the steps to easily test the workflow is:

            - Have nextflow installed.
            - Download input files needed to execute cosifer.
            - Execute './nextflow.nf'
            - Wait for results.

## Citation
```
@article{10.1093/bioinformatics/btaa942,
    author = {Manica, Matteo and Bunne, Charlotte and Mathis, Roland and Cadow, Joris and Ahsen, Mehmet Eren and Stolovitzky, Gustavo A and Martínez, María Rodríguez},
    title = "{COSIFER: a python package for the consensus inference of molecular interaction networks}",
    journal = {Bioinformatics},
    year = {2020},
    month = {11},
    issn = {1367-4803},
    doi = {10.1093/bioinformatics/btaa942},
    url = {https://doi.org/10.1093/bioinformatics/btaa942},
    note = {btaa942},
    eprint = {https://academic.oup.com/bioinformatics/advance-article-pdf/doi/10.1093/bioinformatics/btaa942/34088187/btaa942.pdf},
}
```