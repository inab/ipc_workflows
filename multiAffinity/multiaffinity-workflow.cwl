cwlVersion: v1.0
class: Workflow
id: multiaffinity_workflow
label: multiaffinity-workflow

inputs:
  counts: {type: 'File[]', doc: ""}
  metadata: {type: 'File[]', doc: ""}
  layers: {type: File, doc: ""}

outputs:
  output: {type: Directory, outputSource: multiaffinity/output}

steps:
  multiaffinity:
    run: ./multiaffinity.cwl
    in:
      counts: counts
      metadata: metadata
      layers: layers
    out: [output]
