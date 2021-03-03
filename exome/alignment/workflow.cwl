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
  reference_genome: {type: File, doc: "Compress FASTA files with the reference genome chromosomes"}
  readgroup_str: {type: string, default: '@RG\tID:Seq01p\tSM:Seq01\tPL:ILLUMINA\tPI:330', doc: "Parsing header which should correlate to FASTQ files"}
  sample_name: {type: string, default: 'ABC3', doc: "Sample name"}

outputs:
  md_bam: {type: File, outputSource: picard_markduplicates/md_bam, doc: ""}

steps:
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

  cutadapt:
    run: tools/cutadapt.cwl
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
        source: cutadapt/trimmed_fastq
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
    out: [md_bam]

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0003-4929-1219
    s:email: mailto:laura.rodriguez@bsc.es
    s:name: Laura Rodríguez-Navas

s:dateCreated: "2021-02-19"
s:license: https://spdx.org/licenses/Apache-2.0
