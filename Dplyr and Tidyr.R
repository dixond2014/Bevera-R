#Using the built in the dataset Iris

as_tibble(iris)

#tidyr::gather()
iris %>%
  rownames_to_column(var = "number") %>%
  as_tibble() %>%
  gather(key = flower, value = measure, contains("al")) %>% 
  sample_n(10)

#Tibbles don't have rownames.
#key and value are the names of the resulting columns
#Third argument gives the actual columns -all by default!

#Variant with excluding columns
iris %>%
  rownames_to_column(var = "number") %>%
  as_tibble() %>%
  gather(key = flower_part, value = measure, -Species, -number) -> iris_melt

iris_melt

iris_melt %>%
  spread(flower_part, measure)

#Uses of gather()
iris %>%
  gather(flower, measure, 1:4) %>%
  ggplot() +
  geom_boxplot(aes(x = Species, y = measure, fill = flower))



#pull()
#select() as a vector
#For removing from data frame context

pull(genes_by_transcripts, 2)[1:2]
#[1] "ENST00000516163" "ENST00000617336"
#Using negative indexes
pull(genes_by_transcripts, -2)[1:10]
#[1] -1  1  1  1  1  1 -1  1  1  1
#Extract unique biotype
pull(genes_by_transcripts, gene_biotype) %>%
  unique()

#Comparing rows above and below
#Calculate intergenic distance
#genes_by_transcripts %>%
  dplyr::select(ensembl_gene_id, start_position, end_position) %>% 
  distinct() %>% 
  arrange(start_position) %>% 
  mutate(intergenic_length = start_position - lag(end_position)) 