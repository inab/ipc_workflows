class: CommandLineTool
cwlVersion: v1.0
id: picard_markduplicates

baseCommand: ["picard", "CreateSequenceDictionary"]

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/picard:2.18.25--0'
  ResourceRequirement:
    outdirMin: 7500
    tmpdirMin: 7700

hints:
  ResourceRequirement:
    coresMin: 4
    ramMin: 4000

inputs:
  reference_genome:
    type: File
    inputBinding:
      position: 1
      prefix: 'R='
      separate: false

arguments:
  - position: 2
    prefix: 'O='
    separate: false
    valueFrom: $(inputs.reference_genome.nameroot).dict

outputs:
  dict:
    type: File
    outputBinding:
      glob: "*.dict"
