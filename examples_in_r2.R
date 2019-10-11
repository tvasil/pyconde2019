library(ggplot2)
library(scales)
diamonds


ggplot() + 
  layer(
    data = diamonds, mapping = aes(x = carat, y = price, color = depth),
    geom = 'point', stat = 'identity',
    position = 'identity'
  ) +
  scale_y_log10() + 
  scale_x_log10() + 
  scale_color_viridis_c() +
  coord_cartesian()

head(diamonds)


ggplot(diamonds, aes(carat, price)) + 
  geom_point() + 
  stat_smooth(method = 'lm') + 
  scale_x_log10() + 
  scale_y_log10()



cities <- read.table("/Users/tania/Downloads/ggplot2-minard-gallery/cities.txt",
                     header = TRUE, stringsAsFactors = FALSE)

troops <- read.table("/Users/tania/Downloads/ggplot2-minard-gallery/troops.txt",
                     header = TRUE, stringsAsFactors = FALSE)

temps <- read.table("/Users/tania/Downloads/ggplot2-minard-gallery/temps.txt",
                    header = TRUE, stringsAsFactors = FALSE) 



plot_troops <- ggplot(troops, aes(long, lat)) + 
  geom_path(aes(size = survivors, color = direction, group = group))
plot_troops

plot_both <- plot_troops + 
  geom_text(aes(label = city), 
            size = 4, 
            data = cities)
plot_both

plot_polished <- plot_both +
  scale_size(range = c(1,10),
             breaks = c(1,2,3)*10^5,
             labels = comma(c(1,2,3)*10^5)) +
  scale_color_manual(values = c('grey50', 'red')) + 
  xlab(NULL) + 
  ylab(NULL)

plot_polished

help(comma)



head(diamonds)

ggplot(diamonds, aes(x = carat, y=price)) + geom_smooth(se = F, color = '#45B08c') + theme_void()

ggplot(diamonds, aes(x = carat, y=price)) + geom_point(position = 'jitter', color = '#45B08c') + theme_void()

ggplot(diamonds, aes(x = price)) + geom_histogram(fill = '#45B08c') + theme_void()


ggplot(diamonds, aes(x = cut, y = price)) + 
  geom_bar(stat = "summary", fun.y = "mean", fill = '#45B08c', alpha = 0.7, size = 5, 
           show.legend = TRUE) +
  theme_clean() + 
  theme(axis.title=element_text(size=18)) + 
  scale_y_continuous(labels = comma) +
  coord_cartesian(ylim = c(0, 4500))

ggplot(diamonds, aes(x = cut, y = price)) + 
  geom_bar(stat = "summary", fun.y = "median", fill = 'red', alpha = 0.5) + 
  theme_clean() + 
  theme(axis.title=element_text(size=18)) + 
  scale_y_continuous(labels = comma) + 
  coord_cartesian(ylim = c(0, 4500))

  

ggplot(diamonds, aes(x = cut, y = price)) + 
  geom_boxplot(fill = '#45B08c', alpha = 0.5) + 
  theme_clean() + 
  theme(axis.title=element_text(size=18)) + 
  scale_y_continuous(labels = comma)
