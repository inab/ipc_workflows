cwlVersion: v1.0
class: CommandLineTool
id: samtools-faidx
label: samtools-faidx

doc: Indexing a FASTA file

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.sequences)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/samtools:1.5--2'

baseCommand: ["samtools", "faidx"]

inputs:
  sequences:
    type: File
    inputBinding:
      position: 1

outputs:
  output:
    type: File
    outputBinding:
      glob: "*.fa"
    secondaryFiles:
      - .fai
