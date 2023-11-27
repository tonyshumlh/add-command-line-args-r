"This script output class count.

Usage:
  count_classes2.R <input_data> <col> <output_dir>
" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(input_data, col, output_dir) {
  # read in wisconsin breast cancer data
  data <- read_csv(paste0('data/', input_data))

  col <- sym(col)
  result <- data |> 
    group_by(!!col) |> 
    summarize(Count = n()) |> 
    rename_at(1, ~ "class")

  write.csv(result, paste0('results/', output_dir, '/class_count.csv'))
}

main(opt$input_data, opt$col, opt$output_dir)

# Rscript R/count_classes2.R agaricus-lepiota.csv mushroom-class mushroom