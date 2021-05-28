#!/usr/bin/env nextflow

/*
================================================================================
    VALIDATE INPUTS
================================================================================
*/

params.summary_params = [:]

// Check input path parameters to see if they exist
checkPathParamList = [ params.bam, params.fasta ]
for (param in checkPathParamList) { if (param) { file(param, checkIfExists: true) } }

// Check mandatory parameters (missing protocol or profile will exit the run)
if (params.bam) { bam = file(params.bam) } else { exit 1, 'Input BAM file not specified!' }
if (params.fasta) { fasta = file(params.fasta) } else { exit 1, 'Input FASTA file not specified!' }

// Function to check if running offline
def isOffline() {
  try {
    return NXF_OFFLINE as Boolean
  }
  catch( Exception e ) {
    return false
  }
}

/*
================================================================================
    IMPORT NF-CORE MODULES/SUBWORKFLOWS
================================================================================
*/

include { BCFTOOLS_MPILEUP } from '../modules/nf-core/software/bcftools/mpileup/main' addParams( options: [:] )
// include { BCFTOOLS_FILTER } from './modules/nf-core/software/bcftools/filter/' addParams( options: [:] )

/*
================================================================================
    RUN MAIN WORKFLOW
================================================================================
*/

workflow SAMTOOLS {

    BCFTOOLS_MPILEUP ( bam, fasta )

    // BCFTOOLS_FILTER ()
}

/*
================================================================================
    THE END
================================================================================
*/
