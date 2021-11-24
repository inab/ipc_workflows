# multiAffinity Workflow

The steps to easily test the workflow is:

- Have [cwltool](https://github.com/common-workflow-language/cwltool) installed.
- Test
  - Change to workflow directory
  - Download sample data folder from <https://github.com/marbatlle/multiAffinity/tree/main/sample_data>.
  - Use `cwltool` in this way:

    ```bash
    cwltool --singularity --tmpdir-prefix=work/ --tmp-outdir-prefix=work/ multiaffinity-workflow.cwl multiaffinity.yml
    ```
