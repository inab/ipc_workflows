cwlVersion: v1.0
class: Workflow
id: multiaffinity_workflow
label: multiaffinity-workflow

inputs:
  counts: {type: 'File[]', doc: ""}
  layers: {type: 'File[]', doc: ""}
  metadata: {type: File, doc: ""}

outputs:
  output: {type: File, outputSource: multiaffinity/output}

steps:
  multiaffinity:
    run: ./multiaffinity.cwl
    in:
      counts: counts
      layers: layers
      metadata: metadata
    out: [output]
