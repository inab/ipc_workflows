cwlVersion: v1.0
class: CommandLineTool
id: multiaffinity
label: multiaffinity

$namespaces:
  s: https://schema.org/

hints:
  DockerRequirement:
    dockerPull: 'marbatlle/multiaffinity:latest'

baseCommand: [bash, -c, run.sh]

inputs:
  counts:
    type: 'File[]'
    inputBinding:
      position: 1
  layers:
    type: 'File[]'
    inputBinding:
      position: 2
  metadata:
    type: File
    inputBinding:
      position: 3

outputs:
  output:
    type: File
    outputBinding:
      glob: '*.txt'

s:author:
  - class: s:Person
    s:email: mailto:mar.batlle@bsc.es
    s:name: Mar Batlle

s:dateCreated: "2021-09-15"
