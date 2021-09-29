cwlVersion: v1.0
class: CommandLineTool
id: multiaffinity
label: multiaffinity

$namespaces:
  s: https://schema.org/

hints:
  DockerRequirement:
    dockerPull: 'marbatlle/multiaffinity:latest'

baseCommand: [./multiAffinity]

inputs:
  counts:
    type: 'File[]'
    inputBinding:
      position: 1
      prefix: '-c'
  metadata:
    type: 'File[]'
    inputBinding:
      position: 2
      prefix: '-m'
  layers:
    type: File
    inputBinding:
      position: 3
      prefix: '-n'

outputs:
  output:
    type: Directory
    outputBinding:
      glob: '*'

s:author:
  - class: s:Person
    s:email: mailto:mar.batlle@bsc.es
    s:name: Mar Batlle

s:dateCreated: "2021-09-15"
