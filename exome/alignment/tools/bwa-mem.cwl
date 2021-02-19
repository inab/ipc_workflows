class: CommandLineTool
cwlVersion: v1.0

baseCommand: ["bwa" , "mem", "-M", "-p"]

requirements:
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/bwa:0.7.17--h84994c4_5'
  ResourceRequirement:
    outdirMin: 10500
    tmpdirMin: 10700

hints:
  ResourceRequirement:
    coresMin: 4
    ramMin: 4000

inputs:
  trimmed_fastq:
    type: File
    inputBinding:
      position: 4
  reference_genome:
    type: File
    inputBinding:
      position: 3
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
  sample_name:
    type: string
  threads:
    type: string?
    default: '2'
    inputBinding:
      position: 1
      prefix: '-t'
  read_group:
    type: string
    default: '@RG\\tID:H947YADXX\\tSM:NA12878\\tPL:ILLUMINA'
    inputBinding:
      position: 2
      prefix: '-R'

outputs:
  aligned_sam:
    type: File
    outputBinding:
      glob: "*.sam"

stdout: $(inputs.sample_name).sam
