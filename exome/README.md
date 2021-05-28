## alignment
- input data: raw fastq
- output data: sorted bam with marked (or removed) duplicates
- containers: 
  - [cutadapt (v.1.18)](https://quay.io/repository/biocontainers/cutadapt?tag=1.18--py36h14c3975_1&tab=tags)    
  - [bwa (v.0.7.17)](https://quay.io/repository/biocontainers/bwa?tag=0.7.17--h84994c4_5&tab=tags)
  - [picard (v.2.22.2)](https://quay.io/repository/biocontainers/picard?tag=2.22.2--0&tab=tags)
  - [samtools (v.1.5)](https://quay.io/repository/biocontainers/samtools?tag=1.5--2&tab=tags)

- can run the workflow using the next command line:
```bash
cwltool --outdir={outputs folder} --tmpdir-prefix={intermediate folder} --tmp-outdir-prefix={intermediate folder} alignment/workflow.cwl alignment/workflow.yml
```

## samtools
- input data:
- output data:

## pindel
- input data:
- output data:

## exomeDepth
- input data:
- output data:

normal tumor, [nf-core/exomedepth](https://github.com/PhilPalmer/exomedepth)
