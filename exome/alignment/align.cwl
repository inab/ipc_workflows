class: Workflow
cwlVersion: v1.0
label: align-workflow

requirements:
  - class: MultipleInputFeatureRequirement

$namespaces:
  s: https://schema.org/
  edam: http://edamontology.org/

$schemas:
 - https://schema.org/version/latest/schemaorg-current-https.rdf
 - http://edamontology.org/EDAM_1.18.owl

inputs:
  fastq_files: {type: 'File[]', doc: "List of paired-end input FASTQ files"}
  reference_genome: {type: 'File[]', doc: "Compress FASTA files with the reference genome chromosomes"}
  known_indels_file: {type: File, doc: "VCF file correlated to reference genome assembly with known indels"}
  known_sites_file: {type: File, doc: "VCF file correlated to reference genome assembly with know sites (for instance dbSNP)"}
  chromosome: {type: string, doc: "Label of the chromosome to be used for the analysis. By default all the chromosomes are used"}
  readgroup_str: {type: string, default: '@RG\tID:Seq01p\tSM:Seq01\tPL:ILLUMINA\tPI:330', doc: "Parsing header which should correlate to FASTQ files"}
  sample_name: {type: string, default: 'ABC3', doc: "Sample name"}

outputs:
  md_bam: {type: File, outputSource: picard_markduplicates/md_bam, doc: ""}
  metrics: {type: File, outputSource: picard_markduplicates/output_metrics, doc: "Several metrics about the result"}

steps:
  unzipped_known_sites:
    run: tools/gunzip_known_sites.cwl
    in:
      input: known_sites_file
    out: [output]

  unzipped_known_indels:
    run: tools/gunzip_known_sites.cwl
    in:
      input: known_indels_file
    out: [output]

  gunzip:
    run: tools/gunzip.cwl
    in:
      reference_file: reference_genome
    out: [unzipped_fasta]

  picard_dictionary:
    run: tools/picard_dictionary.cwl
    in:
      reference_genome:
        source: gunzip/unzipped_fasta
    out: [dict]

  cutadapt2:
    run: tools/cutadapt-v.1.18.cwl
    in:
      raw_sequences: fastq_files
    out: [trimmed_fastq]

  bwa_index:
    run: tools/bwa-index.cwl
    in:
      reference_genome:
        source: gunzip/unzipped_fasta
    out: [output]

  samtools_index:
    run: tools/samtools_index.cwl
    in:
      input:
        source: gunzip/unzipped_fasta
    out: [index_fai]

  bwa_mem:
    run: tools/bwa-mem.cwl
    in:
      sample_name: sample_name
      trimmed_fastq:
        source: cutadapt2/trimmed_fastq
      read_group: readgroup_str
      reference_genome:
        source: bwa_index/output
    out: [aligned_sam]

  samtools_sort:
    run: tools/samtools_sort_bam.cwl
    in:
      input:
        source: bwa_mem/aligned_sam
    out: [sorted_bam]

  picard_markduplicates:
    run: tools/picard_markduplicates.cwl
    in:
      input:
        source: samtools_sort/sorted_bam
    out: [md_bam, output_metrics]

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0003-4929-1219
    s:email: mailto:laura.rodriguez@bsc.es
    s:name: Laura Rodríguez-Navas

s:dateCreated: "2021-02-19"
s:license: https://spdx.org/licenses/Apache-2.0
