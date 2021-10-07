cwlVersion: v1.0
class: Workflow
id: multiaffinity_workflow
label: multiaffinity-workflow

inputs:
  counts: {type: 'File[]', doc: "path to counts matrix, single or multiple"}
  metadata: {type: 'File[]', doc: "path to metadata, single or multiple"}
  network: {type: 'File[]', doc: "path to network, single or multiple"}
  DESeq2_padj: {type: float?}
  DESeq2_LFC: {type: int?}
  RRA_Score: {type: float?}
  waddR_resolution: {type: float?}
  waddR_permnum: {type: int?}
  multiXrank_r: {type: float?}
  multiXrank_selfloops: {type: int?}
  multiXrank_delta: {type: float?}
  Molti_modularity: {type: int?}
  Molti_Louvain: {type: int?}

outputs:
  output: {type: Directory, outputSource: multiaffinity/output}

steps:
  multiaffinity:
    run: ./multiaffinity.cwl
    in:
      counts: counts
      metadata: metadata
      network: network
      DESeq2_padj: DESeq2_padj
      DESeq2_LFC: DESeq2_LFC
      RRA_Score: RRA_Score
      waddR_resolution: waddR_resolution
      waddR_permnum: waddR_permnum
      multiXrank_r: multiXrank_r
      multiXrank_selfloops: multiXrank_selfloops
      multiXrank_delta: multiXrank_delta
      Molti_modularity: Molti_modularity
      Molti_Louvain: Molti_Louvain
    out: [output]
