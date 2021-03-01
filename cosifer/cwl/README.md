# COSIFER - COnSensus Interaction Network InFErence Workflow

The steps to easily test the workflow is:

- Have [cwltool](https://github.com/common-workflow-language/cwltool) installed.
- Test 1
  - Change to workflow directory
  - Download example toy input file from <https://raw.githubusercontent.com/PhosphorylatedRabbits/cosifer/master/examples/interactive/data_matrix.csv>.
  - Use `cwltool` in this way:

    ```bash
    cwltool --singularity --tmpdir-prefix=work/ --tmp-outdir-prefix=work/ cosifer-workflow.cwl interactive.yml
    ```

## Citation
```bib
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
