cwlVersion: v1.0
class: Workflow
id: multiaffinity_workflow
label: multiaffinity-workflow

inputs:
  counts: {type: 'File[]', doc: "path to count matrices, single or multiple"}
  metadata: {type: 'File[]', doc: "path to metadata, single or multiple"}
  network: {type: 'File[]', doc: "path to network, single or multiple"}
  DESeq2_padj: {type: string?, doc: "sets p-value adjusted for multiple testing used as cutoff in DESeq2 (default is 0.05)"}
  DESeq2_LFC: {type: string?, doc: "defines log2 foldchange used as cutoff in DESeq2 (default value is 1)"}
  RRA_Score: {type: string?, doc: "significance score defined by RobustRankAggreg as a cutoff (default is 0.05)"}
  waddR_pval: {type: string?, doc: "defines p-value used as cutoff for the semi-parametric 2-Wasserstein distance-based test (default is 0.001)"}
  waddR_permnum: {type: int?, doc: "sets number of permutations used in the Wasserstein test (default is 100)"}
  multiXrank_r: {type: string?, doc: "defines global restart probability for multiXrank, takes values between 0 and 1 (default is 0.5)"}
  multiXrank_selfloops: {type: int?, doc: "defines whether self loops are removed or not, takes values 0 or 1 (default is 0)"}
  Molti_modularity: {type: int?, doc: "sets Newman modularity resolution parameter on molTI-DREAM (default is 1)"}
  Molti_Louvain: {type: int?, doc: "switches to randomized Louvain on molTI-DREAM and set the number of randomizations (default is 0)"}

outputs:
  output: {type: Directory, outputSource: multiaffinity/output, doc: "contains degs, communities and affinity information"}

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
      Molti_modularity: Molti_modularity
      Molti_Louvain: Molti_Louvain
    out: [output]
