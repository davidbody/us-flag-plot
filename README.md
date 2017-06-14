
Plot US flag with R grid graphics
---------------------------------

Example of using R grid graphics to plot US flag.

At our weekly [R and Python study group](https://www.meetup.com/Central-Iowa-R-User-Group/), the idea came up to try to plot the US flag in R using ggplot2. While that may be possible, I chose to do it using [grid](https://stat.ethz.ch/R-manual/R-devel/library/grid/html/00Index.html), which is the graphics library ggplot2 is built on. Here's my solution.

Flag specifications <http://www.vexman.net/flagspec.htm>

``` r
source("us-flag.R")
```

![](README_files/figure-markdown_github/flag-1.png)
