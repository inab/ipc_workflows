class: CommandLineTool
cwlVersion: v1.0

baseCommand: ["gunzip"]

arguments: ["-c", "-v"]

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'ubuntu:xenial'
  ResourceRequirement:
    outdirMin: 7500
    tmpdirMin: 7500

hints:
  ResourceRequirement:
    coresMin: 2
    ramMin: 5000

inputs:
  reference_file:
    type: File
    inputBinding:
      position: 2

outputs:
  unzipped_fasta:
    type: stdout
    streamable: true

stdout: $(inputs.reference_file.nameroot)
