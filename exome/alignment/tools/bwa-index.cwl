cwlVersion: v1.0
class: CommandLineTool
id: bwa-index

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/bwa:0.7.17--h84994c4_5'
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.reference_genome)
  ResourceRequirement:
    outdirMin: 10500
    tmpdirMin: 10500

hints:
  ResourceRequirement:
    ramMin: 4000
    coresMin: 1

baseCommand: ["bwa", "index"]

inputs:
  algorithm:
    type: string?
    inputBinding:
      prefix: -a

  reference_genome:
    type: File
    inputBinding:
      position: 4

  block_size:
    type: int?
    inputBinding:
      position: 2
      prefix: -b

outputs:
  output:
    type: File
    outputBinding:
      glob: "*.fa"
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
