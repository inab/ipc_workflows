#!/usr/bin/env nextflow
 
matrix = file(params.general.data_matrix)
outdir = file(params.general.outputsDir)

process cosifer {
	container "tsenit/cosifer:latest"
 
    input:
    file matrix

    """
    mkdir -p $outdir
    cosifer -i ${matrix} -o ${outdir}
    """
}