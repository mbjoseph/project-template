setwd("./analysis/")
iris <- read.csv("iris.csv") # load data
str(iris) # view structure

# suppose we want to know whether the relationship between 
# sepal length and width differs among species
mod1 <- lm(Sepal.Width ~ Sepal.Length*Species, data=iris)
mod2 <- lm(Sepal.Width ~ Sepal.Length + Species, data=iris)
anova(mod1, mod2) # interaction term is significantly different from 0

# Show the interaction effect
require(ggplot2)
fig1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) + 
  geom_point(size=2) + theme_classic() + 
  stat_smooth(method="lm", aes(fill=Species), se=F)
ggsave("figure1.pdf", fig1, width=5, height=3)

# Show the default plots for lm
pdf("figure2.pdf", width=8, height=6)
par(mfrow=c(2,2))
plot(mod1)
dev.off()

# Create regression table and save it as an .md file
library(pander)                         # load pkg
panderOptions('table.style', 'simple')
panderOptions('table.split.table', Inf)
set.caption('Regression model coefficients')            # add caption
sink(file="table.md")
cat("# Tables")
pander(mod1)
sink()