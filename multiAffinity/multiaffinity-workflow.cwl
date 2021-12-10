cwlVersion: v1.0
class: Workflow
id: multiaffinity_workflow
label: multiaffinity-workflow

$namespaces:
  s: http://schema.org/

inputs:
  counts: {type: 'File[]', doc: "Count Matrices of the RNA-Seq studies - List of input CSV files, separated by commas"}
  metadata: {type: 'File[]', doc: "Metadata of the RNA-Seq studies - List of input CSV files, separated by commas"}
  layers: {type: 'File[]', doc: "Layers of the multilayer networks - List of input CSV files, separated by commas"}
  approach: {type: 'string?', doc: "Filters the analysis by all genes or by communities. Valid arguments are full or communities (default is communities)"}
  output_dir: {type: 'string?', doc: "Defines name for output folder"}
  padj: {type: 'string?', doc: "Sets p-value adjusted for multiple steps of the tool, including, DESeq2, RobustRankAggreg, waddR and Spearman's Correlation (default is 0.05)"}
  LFC: {type: 'string?', doc: "Defines log2FC value to filter significant DEG in DESeq2 (default is 1.0)"}
  control_id: {type: 'string?', doc: "Specifies the id label for the control samples in the metadata files (default is Normal)"}
  multiXrank_r: {type: 'string?', doc: "Defines global restart probability for multiXrank, takes values between 0 and 1 (default is 0.5)"}
  multiXrank_selfloops: {type: 'int?', doc: "Defines whether self loops are removed or not, takes values 0 or 1 (default is 0)"}
  Molti_modularity: {type: 'int?', doc: "Sets Newman modularity resolution parameter on molTI-DREAM (default is 1)"}
  Molti_Louvain: {type: 'int?', doc: "Sets the number of randomizations on Louvain(default is 5)"}

outputs:
  output: {type: Directory, outputSource: tool/output, doc: "Contains degs, communities and affinity information"}

steps:
  tool:
    run: ./multiaffinity.cwl
    in:
      counts: counts
      metadata: metadata
      layers: layers
      approach: approach
      output_dir: output_dir
      padj: padj
      LFC: LFC
      multiXrank_r: multiXrank_r
      control_id: control_id
      Molti_modularity: Molti_modularity
      multiXrank_selfloops: multiXrank_selfloops
      Molti_Louvain: Molti_Louvain
    out: [output]

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-8508-6234
    s:email: mailto:mar.batlle@bsc.es
    s:name: Mar Batlle
  - class: s:Person
    s:identifier: https://orcid.org/0000-0003-4929-1219
    s:email: mailto:laura.rodriguez@bsc.es
    s:name: Laura Rodríguez-Navas

s:dateCreated: "2021-09-15"
