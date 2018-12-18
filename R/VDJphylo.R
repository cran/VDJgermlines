#' Infers basic phylogenetic trees of VDJ germlines of interest with basic distance methods.
#'
#' @inheritParams extractSequencesR
#' @import ape stringdist
#' @param inference.method Specifies the method to be used to infer the phylogenetic tree. Currently includes
#' "lv" for Levenshtein distance.
#' @return Returns an unrooted tree inferred using the neighbor joining algorithm. Can be viewed by plot(output_tree) after loading ape package.
#' @export
#' @examples
#' VDJphylo(species = "dog",chain = "IGHD",source = "IMGT",write.fasta = FALSE)
VDJphylo <- function(species,
                     chain,
                     source,
                     write.fasta,
                     fasta.name,
                     directory.string,
                     inference.method){
  if(missing(directory.string)){
    directory.string <- getwd()
  }
  if(missing(fasta.name)){
    fasta.name <- "VDJgermlines"
  }
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
  if(write.fasta==T){
    ape::write.dna(x=as.matrix(x=c(internal_vdj_df$sequence,internal_vdj_df$names)),
                   format="fasta", file=paste(directory.string,"/",fasta.name,"_",".fasta",sep=""))

  }
  ## Tree calculation
  temp_leven_matrix <- stringdist::stringdistmatrix(internal_vdj_df$sequence, method=inference.method)
  temp_leven_tree <- ape::nj(temp_leven_matrix)
  for(m in 1:length(temp_leven_tree$tip.label)){
    temp_leven_tree$tip.label[m] <- internal_vdj_df$names[m]
  }
  return(temp_leven_tree)
}
