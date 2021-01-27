#!/usr/bin/env nextflow
 
data_matrix = file(params.data_matrix)
outdir = file(params.outputsDir)
result = outdir.mkdirs()
println result ? "Created directory $outdir" : "Cannot create output directory: $outdir"

separator = params.sep
index_col = params.index_col
gmt_filepath = file(params.hallmark_gene_sets_file != '' ? params.hallmark_gene_sets_file : '.empty.')

cosifer_input = Channel.create()

cosifer_input << data_matrix

process cosifer {
    container "tsenit/cosifer:b4d5af45d2fc54b6bff2a9153a8e9054e560302e"
    
    publishDir outdir

    input:
	file matrix from cosifer_input
	file gmt_filepath
	val separator
	val index_col

    output:
	path '${outdir}/*' into cosifer_output

    """
    mkdir -p "${outdir}"
    cosifer -i "${matrix}" "--sep=${separator}" ${index_col!='' ? '--index ' + index_col : ''}  ${gmt_filepath.name != '.empty.' ? '--gmt_filepath ' + gmt_filepath : ''} -o "${outdir}"
    """
}
