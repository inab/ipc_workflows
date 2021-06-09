#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

/*
================================================================================
    PRINT HELP
================================================================================
*/

def helpMessage() {
    log.info nfcoreHeader()
    log.info"""

    Usage:

    The command for running the pipeline is as follows:

    nextflow main.nf --bam sample.bam --fasta sample.fa -profile singularity

    Mandatory arguments:
      --bam         [file] Path to input BAM file

      --bam         [file] Path to input FASTA file

      -profile      [str] Configuration profile to use. Can use multiple (comma separated)
                          Available: docker, singularity and more

    """.stripIndent()
}

// Show help message
if (params.help) exit 0, helpMessage()

/*
================================================================================
    RUN main WORKFLOW
================================================================================
*/

workflow {
  /*
  * RUN EXOME SAMTOOLS WORKFLOW
  */
  include { SAMTOOLS } from './workflow/samtools' addParams( [:] )
  SAMTOOLS ()
}

/*
================================================================================
    THE END
================================================================================
*/
