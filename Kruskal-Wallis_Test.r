
#Runs Kruskal-Wallis test for the Detwiler fire since this particular data did not meet the assumptions of ANOVA
kruskal.test(dNBR ~ index, data=DdNBR)

#Returns table displaying mean dNBR per index
DdNBR %>% group_by(index) %>% summarize_all(funs(mean))

#runs a pairwise comparison using Kruskal-Wallis (KW) test to determine if significant differences in dNBR values exist between index groups 
DKWPW <- pairw.kw(DdNBR$dNBR, DdNBR$index, conf=0.95)
DKWPW

#do not use if assumptions of ANOVA are not met. This runs a pairwise comparison using ANOVA to determine if significant differences in dNBR values exist between index groups
DANOVAPW <- pairw.anova(DdNBR$dNBR, DdNBR$index, conf=0.95)
DANOVAPW

#converts results of pairwise test to a data frame
DKWPW_results <- as.data.frame(DKWPW[4:4])

#writes the .csv file of the pairwise results dataframe
write.csv(DKWPW_results, "Detwiler_Pairwise_Results.csv")