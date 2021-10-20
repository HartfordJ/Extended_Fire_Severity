
ts <- read.csv("Detwiler.csv")

#adds new nbr column and populates all fields
ts <- ts %>% mutate(nbr = (B5-B7)/(B5+B7))

#formats date column to workable format
ts$date2 <- as.Date(ts$date2, "%m/%d/%y")

#modifies the data frame so that the dNBR values are calculated and displayed for each point, categorized by time-since-fire
ts_sub <- ts[,c("SiteID", "date2", "nbr")]
ts_re <- melt(ts_sub, id=c("SiteID", "date2"), measured=c("nbr"))
ts_re2 <- cast(ts_re, SiteID ~ date2)
names(ts_re2) <- c("ID", "Pre", "Post", "Y1", "Y2", "Y3")

ts_re2$D1 <- ts_re2$Pre - ts_re2$Post
ts_re2$D2 <- ts_re2$Pre - ts_re2$Y1
ts_re2$D3 <- ts_re2$Pre - ts_re2$Y2
ts_re2$D4 <- ts_re2$Pre - ts_re2$Y3

bplot1 <- ts_re2[,c(1, 7)]
bplot1$date <- "Post-Fire"
names(bplot1) <- c("ID", "dNBR", "date")
bplot1$index <- 1

bplot2 <- ts_re2[,c(1, 8)]
bplot2$date <- "Year 1"
names(bplot2) <- c("ID", "dNBR", "date")
bplot2$index <- 2

bplot3 <- ts_re2[,c(1, 9)]
bplot3$date <- "Year 2"
names(bplot3) <- c("ID", "dNBR", "date")
bplot3$index <- 3

bplot4 <- ts_re2[,c(1, 10)]
bplot4$date <- "Year 3"
names(bplot4) <- c("ID", "dNBR", "date")
bplot4$index <- 4

DdNBR <- bind_rows(bplot1, bplot2, bplot3, bplot4)