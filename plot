library(readxl)
# read th eoutage data
outage<- read_excel("outage.xlsx")
# filter to remove NAs
outage<- filter(outage, outage$regionName !="NA")
# count the occurance for region
count_out<- outage%>%
  group_by(regionName)%>%
  count(regionName)
# plot the distribution of data for region
ggplot(data = count_out, aes(x = regionName, y = n)) +
geom_point() +
theme(panel.background = element_rect(fill = "white"),
axis.line.x=element_line(),
axis.line.y=element_line()) +
ggtitle("outage distribution")
