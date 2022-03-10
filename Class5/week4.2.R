#' ---
#' title: "Week 4 Data Visualization Lab"
#' author: "Macy Hoang (PID: A15404564)"
#' ---

# Week 4 Data Visualization Lab

#install.packages(ggplot2)

#Any time I want to use this package (ggplot2) I need to load it
library(ggplot2)

View(cars)

# A quick base R plot- this is not a ggplot
plot(cars)

# Our first ggplot
# We need data (car) + aes (x,y) + geoms

ggplot(data = cars) +
  aes(x=speed, y= dist) +
  geom_point()

p <- ggplot(data = cars) +
  aes(x=speed, y= dist) +
  geom_point()

# Add a line geom with geom_line
p + geom_line()

# Add a trend line closer to the data 
p+ geom_smooth()

# Add a linear line
p+ geom_smooth(method = "lm")

#----------------------#

# Read in our drug expression data
url <- 
  "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Q. How many genes are in this dataset?
nrow(genes)

# Q. What are the column names and how many are there?
colnames(genes)
ncol(genes)

# Q. How many upregulated genes
table(genes$State)

# Q. What fraction of total genes is up-regulated?
round((table(genes$State)/ nrow(genes)) *100, 2)

# Let's make a first plot attempt
g <- ggplot(data = genes) + aes(x=Condition1, y= Condition2, col=State) +
  geom_point()

#g

# Add some color 
#g + scale_color_manual(values = c("blue", "gray", "red")) +
#  labs(title= "Gene expression", x= "Control (no drug)", y= "Drug treatment" ) +
#  theme_bw()


