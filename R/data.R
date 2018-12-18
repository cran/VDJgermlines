#' VDJgermlines
#'
#' The germline information for a variety of species is contained in the VDJgermlines dataframe.
#'
#' @format A data frame with 7285 rows and 8 variables:
#' \describe{
#'   \item{sequence}{The sequence directly from either IMGT or Vgenerepertoire}
#'   \item{names}{The corresponding name of the sequence including V gene number, species}
#'   \item{species}{The casual species name - e.g. dog, mouse, rat}
#'   \item{chain}{The corresponding chain names, including IGHV, IGHL, TRAV, etc}
#'   \item{accession}{The accession number of the given gene}
#'   \item{species_name_official}{The more scientific species name e.g. mus musculus}
#'   \item{source}{The database that annotated the sequence}
#'   \item{strain}{The accompanying strain if available (e.g. B6 vs BALB/c)}
#' }
#' @source IMGT and Vgenerepertoire IMGT (the international ImMunoGeneTics information system (founder and director: Marie-Paule Lefranc, Montpellier, France)." : Lefranc, M.-P. et al., Nucleic Acids Research, 27, 209-212 (1999) Cover; Ruiz, M. et al.,  Nucleic Acids Research, 28, 219-221 (2000); Lefranc, M.-P., Nucleic Acids Research, 29, 207-209 (2001); Lefranc, M.-P., Nucleic Acids Res., 31, 307-310 (2003); Lefranc, M.-P. et al., In Silico Biol., 5, 0006 (2004) [Epub], 5:45-60 (2005); Lefranc, M.-P. et al., Nucleic Acids Res., 33, D593-D597 (2005) Full text; Lefranc, M.-P. et al., Nucleic Acids Research 2009 37(Database issue): D1006-D1012; doi:10.1093/nar/gkn838 Full text. Nucleic Acids Res. 2015 Jan 28;43(Database issue):D413-422. doi: 10.1093/nar/gku1056. Epub 2014 Nov 5. Full text) and Vgenerepertoire (Immunogenetics. 2014 Aug;66(7-8):479-92. doi: 10.1007/s00251-014-0784-3. Epub 2014 Jun 4. and Vgenerepertoire (Genomic V exons from whole genome shotgun data in reptiles. Olivieri DNx, von Haeften B, Sánchez-Espinel C, Faro J, Gambón-Deza F.).
"VDJgermlines"
