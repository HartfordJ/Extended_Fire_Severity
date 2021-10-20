
setwd("Working_Directory")

#names the list of files (used for original data with multiple .csv files in folder)
files <- list.files(pattern = '\\.csv$', full.names = TRUE)

#combines the .csv files into one
all_data <- do.call(rbind, lapply(files, function(x) 
  transform(read.csv(x), File = basename(x))))

#formats the date for specified columns
all_data$date2 <- substring(all_data$date, 1, 10)
all_data$date2 <- as.Date(all_data$date, "%Y-%m-%d")

#names pixel quality values that are acceptible
ls8_valid <- c(322, 386, 834, 898, 1346, 324, 388, 836, 900, 1348)

#filters out all data that do not contain acceptible pixel quality values (ie. cloud cover or shadow)
ls8_clean <- all_data %>% filter(pixel_qa %in% ls8_valid)

#output new .csv
write.csv(ls8_clean, "Working_Directory/landsat_clean.csv")