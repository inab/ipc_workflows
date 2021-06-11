## alignment workflow

The steps to easily test the alignment workflow are:

- Have [cwltool](https://github.com/common-workflow-language/cwltool) installed.

- Use cwltool in this way:

```bash
cwltool --outdir={outputs folder} --tmpdir-prefix={intermediate folder} --tmp-outdir-prefix={intermediate folder} alignment/workflow.cwl alignment/workflow.yml
```

## samtools workflow

The steps to easily test the samtools workflow are:

- Have [nextflow](https://www.nextflow.io/) installed.

- Use nextflow in this way:

```bash
nextflow main.nf --meta <tumor/normal> --bam {BAM file} --fasta {FASTA file} -profile <docker/singularity>
```

## pindel workflow


## exomeDepth workflow

