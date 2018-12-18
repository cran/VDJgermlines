#' Extracts the germline genes of interest and stores them as a dataframe
#'
#' @param species Specifies desired species. Current species options can be found by running unique(VDJgermlines$species) after loading in data(VDJgermlines). "all_species" will select all available species. Species include ("alpaca","bovine","crab_eating_macaque","dog",
#' "human","mouse","pig","platypus","rabbit",raintrout","rat","rhesus monkey","salmon",
#' "sheep","zebrafish","atlanticcod","catfish","teleostei","goat","dolphin","mamonkey",
#' "camel","runny")
#' @param chain Specifies the desired chain. "all_chains" will select all chains. The various chains can be listed by running unique(VDJgermlines$chain).Antibody loci start with IG, TCR starts with TR.NExt comes either heavy, light, alpha, beta etc. Examples include IGHD IGHJ IGHV IGIJ IGIV IGKJ IGKV IGLJ IGLV TRAJ TRAV TRBD TRBJ TRBV TRDD TRDJ TRDV TRGJ TRGV
#' @param source Specifies from which source the desired chains should be taken from.  Current sources can be found by running unique(VDJgermlines$source) after loading in data(VDJgermlines). IMGT and vgenerepertoire are currently present.
#' @param write.fasta A boolean (TRUE / FALSE) value that species if the output sequences should be also written as a fasta file.
#' @param fasta.name A string specifying the name of the fasta file. If this is left blank this will be defaulted to "VDJgermlines.fasta". Manually including extension is not needed.
#' @param directory.string A string stating the directory that the fasta file should be saved to. If left blank the
#' fasta file will be stored in the current working directory.
#' @return Returns a dataframe containing the species and chains of interest from the desired source. The columns of the dataframe include sequence, names, species, chain, accession, official species name, source, and strain. Furthermore, if write.fasta is set to TRUE then the output will additionally include a fasta file.
#' @export
#' @examples
#' extractSequencesR(species = "dog",chain = "IGHD",source = "IMGT",write.fasta = FALSE)
extractSequencesR <- function(species,
                              chain,
                              source,
                              write.fasta,
                              fasta.name,
                              directory.string
                              ){
  #VDJgermlines::VDJgermlines
  if(missing(directory.string)){
    directory.string <- getwd()
  }
  if(missing(fasta.name)){
    fasta.name <- "VDJgermlines"
  }

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
  return(internal_vdj_df)
}
