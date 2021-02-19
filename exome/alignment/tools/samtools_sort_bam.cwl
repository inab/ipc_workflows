class: CommandLineTool
cwlVersion: v1.0
id: samtools-bam_sort

baseCommand: ["samtools", "sort"]

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/samtools:1.3.1--5'
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
      position: 2
  threads:
    type: string?
    default: "8"
    inputBinding:
      position: 1
      prefix: '--threads'

arguments:
  - position: 2
    prefix: '-o'
    valueFrom: $(inputs.input.nameroot).sorted.bam

outputs:
  sorted_bam:
    type: File
    outputBinding:
      glob: "*.sorted.bam"
