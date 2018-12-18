#' Calculates the distance between VDJ germlines of interest and produces a matrix that can be used for further analysis or viewed using Heatmap/pheatmap/ComplexHeatmap.
#'
#' @inheritParams extractSequencesR
#' @import stringdist
#' @param inference.method Specifies the distance metric to be used to calculate distance. Currently includes parameters from stringdist::stringdistmatrix(), such as "lv","jv","hamming","qgram","cosine","Jaccard","lcs", or "soundex".
#' @return Returns a matrix where the entries correspond to the VDJ germlines used the neighbor joining algorithm. Can be viewed by heatmap() in base r, or pheatmap::pheatmap(VDJheatmap).
#' @export
#' @examples
#' VDJheatmap(species = "dog",chain = "IGHD",source = "IMGT")
VDJheatmap <- function(species,
                     chain,
                     source,
                     inference.method){
  if(missing(inference.method)) inference.method <- "lv"

  if(species=="all_species"){
    species_index <- 1:nrow(VDJgermlines::VDJgermlines)
  }
  else{
    species_index <- which(VDJgermlines::VDJgermlines$species %in% species)
  }
  if(chain=="all_chains") chain_index <-  1:nrow(VDJgermlines::VDJgermlines)
  else{
    chain_index <- which(VDJgermlines::VDJgermlines$chain %in% chain)
  }
  if(source=="all_sources") source_index <-  1:nrow(VDJgermlines::VDJgermlines)
  else{
    source_index <- which(VDJgermlines::VDJgermlines$source %in% source)
  }
  internal_vdj_df <- VDJgermlines::VDJgermlines[Reduce(intersect, list(species_index,chain_index,source_index)),]

  ## Tree calculation
  temp_leven_matrix <- stringdist::stringdistmatrix(internal_vdj_df$sequence,internal_vdj_df$sequence, method=inference.method)
  diag(temp_leven_matrix) <- NA
  rownames(temp_leven_matrix) <- internal_vdj_df$names
  colnames(temp_leven_matrix) <- internal_vdj_df$names
  return(temp_leven_matrix)
}
