class: CommandLineTool
cwlVersion: v1.0
id: samtools-faidx

baseCommand: ["samtools", "faidx"]

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/samtools:1.3.1--5'
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.input)
  ResourceRequirement:
    outdirMin: 7500
    tmpdirMin: 7700

hints:
  ResourceRequirement:
    coresMin: 8
    ramMin: 8000

inputs:
  input:
    type: File
    inputBinding:
      position: 1

outputs:
  index_fai:
    type: File
    outputBinding:
      glob: "*.fa"
    secondaryFiles:
      - .fai
