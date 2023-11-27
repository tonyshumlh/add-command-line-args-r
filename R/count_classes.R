library(tidyverse)

main <- function() {
  # read in wisconsin breast cancer data
  data <- read_csv('data/cancer_train.csv')

  result <- data |> 
    group_by(diagnosis) |> 
    summarize(Count = n()) |> 
    rename_at(1, ~ "class")

  write.csv(result, 'results/cancer/class_count.csv')
}

main()
