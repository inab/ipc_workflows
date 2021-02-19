class: CommandLineTool
cwlVersion: v1.0

baseCommand: ["gunzip"]

arguments: ["-c"]

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'jlaitinen/lftpalpine'
  ResourceRequirement:
    coresMin: 2
    ramMin: 2000
    outdirMin: 12500
    tmpdirMin: 12500

inputs:
  input:
    type: File
    inputBinding:
      position: 1

outputs:
  output:
    type: stdout

stdout: $(inputs.input.nameroot)
