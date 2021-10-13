cwlVersion: v1.0
class: Workflow
id: multiaffinity_workflow
label: multiaffinity-workflow

inputs:
  counts: {type: 'File[]', doc: "path to counts matrix, single or multiple"}
  metadata: {type: 'File[]', doc: "path to metadata, single or multiple"}
  network: {type: 'File[]', doc: "path to network, single or multiple"}
  DESeq2_padj: {type: string?}
  DESeq2_LFC: {type: string?}
  RRA_Score: {type: string?}
  waddR_pval: {type: string?}
  waddR_permnum: {type: int?}
  multiXrank_r: {type: string?}
  multiXrank_selfloops: {type: int?}
  multiXrank_delta: {type: string?}
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
      waddR_pval: waddR_pval
      waddR_permnum: waddR_permnum
      multiXrank_r: multiXrank_r
      multiXrank_selfloops: multiXrank_selfloops
      multiXrank_delta: multiXrank_delta
      Molti_modularity: Molti_modularity
      Molti_Louvain: Molti_Louvain
    out: [output]
