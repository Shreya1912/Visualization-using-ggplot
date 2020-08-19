library(ggplot2)
df <- read.csv('Economist_Assignment_Data.csv')
head(df)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

ggplot(df, aes(x=CPI, y=HDI)) + 
  geom_point(aes(color=Region), size=3, pch=1) +
  geom_smooth(aes(group=1), method='lm', formula = y ~ log(x), se = FALSE, color='red') +
  geom_text(aes(label = Country), color = "gray20", data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(name = 'Corruption Perception Index, 2011 (10 = Least Corrupt)', limits = c(0,10), breaks = 1:10) +
  scale_y_continuous(name = 'Human Development Index, 2011 (1 = Best)', limits = c(0.2,1)) +
  ggtitle('Corruption and Human Development') 
  





