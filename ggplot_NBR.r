
###to graph dNBR values rather than NBR, call upon the name asigned to the binded rows from the dNBR Reshape file, in my case the name is "DdNBR"

#names the start date of the fire for reference in graph
fire_start <- as.Date(ts[1,8], "%m/%d/%y")

#names the end date of the fire for reference in graph
fire_end <- as.Date(ts[1,9], "%m/%d/%y")

#averages nbr values of all points
ts_mn <- ts %>% group_by(date2) %>% summarize(nbr = mean(nbr))

#Plots the average nbr values of all points
ggplot(ts_mn, aes(x=date2, y=nbr))+
  geom_line(size=1)+
  geom_point(size=3)+
  geom_text(aes(label=date2),hjust="inward", vjust=-0.5)+
  geom_vline(xintercept = fire_start, linetype="dotted", color = "red", size=1.5)+
  geom_vline(xintercept = fire_end, linetype="dotted", color = "blue", size=1.5)+
  ggtitle("Burn Index Time Series")+
  labs(x="Date", y="NBR")+
  theme_bw()+
  scale_y_continuous(breaks = c(-0.5, -0.25, 0, 0.25, 0.5), 
                     limits=c(-0.5,0.5), 
                     labels= c("-0.5", "-0.25", "0", "0.25", "0.5"))+
  scale_x_date(date_breaks = "6 month")+
  theme(axis.text.x = element_text(angle = 45, hjust=1, size = 12)) + theme(axis.text.y = element_text(size = 12)) +
  theme(axis.title = element_text(size = 14)) + theme(axis.title.x = element_text(vjust=-0.4)) +
  theme(plot.title = element_text(size = 18))

#plots all 20 points per fire on the same graph
ggplot(ts, aes(x=date2, y=nbr, col=SiteID))+
  geom_line(size=1)+
  geom_point(size=3)+
  geom_text(aes(label=date2),hjust="inward", vjust=-0.5)+
  geom_vline(xintercept = fire_start, linetype="dotted", color = "red", size=1.5)+
  geom_vline(xintercept = fire_end, linetype="dotted", color = "blue", size=1.5)+
  ggtitle("Burn Index Time Series")+
  labs(x="Date", y="NBR")+
  theme_bw()+
  scale_y_continuous(breaks = c(-0.5, -0.25, 0, 0.25, 0.5), 
                     limits=c(-0.5,0.5), 
                     labels= c("-0.5", "-0.25", "0", "0.25", "0.5"))+
  scale_x_date(date_breaks = "6 month")+
  theme(axis.text.x = element_text(angle = 45, hjust=1, size = 12)) + theme(axis.text.y = element_text(size = 12)) +
  theme(axis.title = element_text(size = 14)) + theme(axis.title.x = element_text(vjust=-0.4))

#filters and names Detwiler 1 points
dw1 <- ts %>% filter(SiteID == "Detwiler1")

#plots one point on a graph
ggplot(dw1, aes(x=date2, y=nbr))+
  geom_line(size=1)+
  geom_point(size=3)+
  geom_text(aes(label=date2),hjust="inward", vjust=-0.5)+
  geom_vline(xintercept = fire_start, linetype="dotted", color = "red", size=1.5)+
  geom_vline(xintercept = fire_end, linetype="dotted", color = "blue", size=1.5)+
  ggtitle("Burn Index Time Series")+
  labs(x="Date", y="NBR")+
  theme_bw()+
  scale_y_continuous(breaks = c(-0.5, -0.25, 0, 0.25, 0.5), 
                     limits=c(-0.5,0.5), 
                     labels= c("-0.5", "-0.25", "0", "0.25", "0.5"))+
  scale_x_date(date_breaks = "6 month")+
  theme(axis.text.x = element_text(angle = 45, hjust=1, size = 12)) + theme(axis.text.y = element_text(size = 12)) +
  theme(axis.title = element_text(size = 14)) + theme(axis.title.x = element_text(vjust=-0.4))



	 
	