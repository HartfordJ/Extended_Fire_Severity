
#Runs ANOVA from which assumptions of ANOVA can be tested - for ANOVA, must have equal variances using Bartlett's Test and Normality using Shapiro-Wilks tests and QQ Plot
DAOV <- aov(dNBR ~ index, data=DdNBR)

#creates four plots that can be used to test assumptions of ANOVA, including QQ-Plot for normality
plot(DAOV)

#Runs Bartlett test, with p-values <0.05 representing unequal variances - for this use Kruskal Wallis test instead of ANOVA. If >0.05 and data is distributed normally, use ANOVA
bartlett.test(dNBR ~ index, data=DdNBR)

#Runs Shapiro-Wilk test, with p-values <0.05 representing non-normality in the data
shapiro.test(DdNBR$dNBR)