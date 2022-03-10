---
title: "Week 4 Data Visualization Lab"
author: "Macy Hoang (PID: A15404564)"
---


```r
# Week 4 Data Visualization Lab

#Any time I want to use this package (ggplot2) I need to load it
library(ggplot2)

View(cars)

# A quick base R plot- this is not a ggplot
plot(cars)
```

![](week4.2_files/figure-latex/unnamed-chunk-1-1.pdf)<!-- --> 

```r
# Our first ggplot
# We need data (car) + aes (x,y) + geoms

ggplot(data = cars) +
  aes(x=speed, y= dist) +
  geom_point()
```

![](week4.2_files/figure-latex/unnamed-chunk-1-2.pdf)<!-- --> 

```r
p <- ggplot(data = cars) +
  aes(x=speed, y= dist) +
  geom_point()

# Add a line geom with geom_line
p + geom_line()
```

![](week4.2_files/figure-latex/unnamed-chunk-1-3.pdf)<!-- --> 

```r
# Add a trend line closer to the data 
p+ geom_smooth()
```

```
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](week4.2_files/figure-latex/unnamed-chunk-1-4.pdf)<!-- --> 

```r
# Add a linear line
p+ geom_smooth(method = "lm")
```

```
## `geom_smooth()` using formula 'y ~ x'
```

![](week4.2_files/figure-latex/unnamed-chunk-1-5.pdf)<!-- --> 

```r
# Read in our drug expression data
url <- 
  "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
```

```
##         Gene Condition1 Condition2      State
## 1      A4GNT -3.6808610 -3.4401355 unchanging
## 2       AAAS  4.5479580  4.3864126 unchanging
## 3      AASDH  3.7190695  3.4787276 unchanging
## 4       AATF  5.0784720  5.0151916 unchanging
## 5       AATK  0.4711421  0.5598642 unchanging
## 6 AB015752.4 -3.6808610 -3.5921390 unchanging
```

```r
# Q. How many genes are in this dataset?
nrow(genes)
```

```
## [1] 5196
```

```r
# Q. What are the column names and how many are there?
colnames(genes)
```

```
## [1] "Gene"       "Condition1" "Condition2" "State"
```

```r
ncol(genes)
```

```
## [1] 4
```

```r
# Q. How many upregulated genes
table(genes$State)
```

```
## 
##       down unchanging         up 
##         72       4997        127
```

```r
# Q. What fraction of total genes is up-regulated?
round((table(genes$State)/ nrow(genes)) *100, 2)
```

```
## 
##       down unchanging         up 
##       1.39      96.17       2.44
```

```r
# Let's make a first plot attempt
g <- ggplot(data = genes) + aes(x=Condition1, y= Condition2, col=State) +
  geom_point()

g
```

![](week4.2_files/figure-latex/-#-1.pdf)<!-- --> 

```r
# Add some color 
g + scale_color_manual(values = c("blue", "gray", "red")) +
  labs(title= "Gene expression", x= "Control (no drug)", y= "Drug treatment" ) +
  theme_bw()
```

![](week4.2_files/figure-latex/-#-2.pdf)<!-- --> 



---
date: '2022-02-05'

---
