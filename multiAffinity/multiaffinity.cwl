cwlVersion: v1.0
class: CommandLineTool
id: multiaffinity
label: multiaffinity

$namespaces:
  s: https://schema.org/

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.counts)
      - $(inputs.metadata)
      - $(inputs.network)

hints:
  DockerRequirement:
    dockerPull:: 'marbatlle/multiaffinity:latest'

baseCommand: [multiAffinity]

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
  network:
    type: 'File[]'
    inputBinding:
      position: 3
      prefix: '-n'
  DESeq2_padj:
    type: float?
    default: 0.05
    inputBinding:
      position: 4
      prefix: '-a'
  DESeq2_LFC:
    type: int?
    default: 1
    inputBinding:
      position: 5
      prefix: '-b'
  RRA_Score:
    type: float?
    default: 0.05
    inputBinding:
      position: 6
      prefix: '-d'
  waddR_resolution:
    type: float?
    default: 0.001
    inputBinding:
      position: 7
      prefix: '-e'
  waddR_permnum:
    type: int?
    default: 10000
    inputBinding:
      position: 8
      prefix: '-f'
  multiXrank_r:
    type: float?
    default: 0.5
    inputBinding:
      position: 9
      prefix: '-g'
  multiXrank_selfloops:
    type: int?
    default: 0
    inputBinding:
      position: 10
      prefix: '-h'
  multiXrank_delta:
    type: float?
    default: 0.05
    inputBinding:
      position: 11
      prefix: '-i'
  Molti_modularity:
    type: int?
    default: 1
    inputBinding:
      position: 12
      prefix: '-j'
  Molti_Louvain:
    type: int?
    default: 0
    inputBinding:
      position: 13
      prefix: '-k'

outputs:
  output:
    type: Directory
    outputBinding:
      glob: '*'

s:author:
  - class: s:Person
    s:email: mailto:mar.batlle@bsc.es
    s:name: Mar Batlle
  - class: s:Person
    s:email: mailto:laura.rodriguez@bsc.es
    s:name: Laura Rodríguez-Navas

s:dateCreated: "2021-09-15"
