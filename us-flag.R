library(grid)

scale <- 3
flag_hoist <- 1.0 * scale
flag_fly <- 1.9 * scale
union_hoist <- 7/13 * scale
union_fly <- 0.76 * scale

old_glory_red <- "#B22234"
old_glory_blue <- "#3C3B6E"

grid.newpage()
vp <- viewport(x = 0.5, y = 0.5,
               height = unit(flag_hoist, "inches"),
               width = unit(flag_fly, "inches"))
pushViewport(vp)

stripe <- Vectorize(function(n) {
    color <- if (n %% 2 == 0) "white" else old_glory_red
    list(x = 0, y = flag_hoist - n * (flag_hoist / 13),
         height = flag_hoist / 13, width = flag_fly,
         color = color)
}, SIMPLIFY = FALSE)

stripes <- stripe(1:13)

drawStripe <- function(s) {
    grid.rect(unit(s$x, "inches"), unit(s$y, "inches"),
              unit(s$width, "inches"), unit(s$height, "inches"),
              gp = gpar(fill = s$color, col = s$color),
              just = c("left", "bottom"))
}

lapply(stripes, drawStripe)

grid.rect(0, unit(flag_hoist - union_hoist, "inches"),
          unit(union_fly, "inches"), unit(union_hoist, "inches"),
          gp = gpar(fill = old_glory_blue, col = old_glory_blue),
          just = c("left", "bottom"))

star <- function(x, y, radius) {
    theta <- seq(pi/2, 4*pi, 4*pi/5)
    data.frame(x = x + radius * cos(theta), y = y + radius * sin(theta))
}

starsForRow <- function(n) {
    if (n %% 2 == 0) {
        xs <- seq(0.126, 5 * 0.126, 0.126) * scale
        ys <- rep(1 - n * 0.054, 5) * scale
        rs <- rep(0.0308, 5) * scale
    } else {
        xs <- seq(0.063, 11 * 0.063, 0.126) * scale
        ys <- rep(1 - n * 0.054, 6) * scale
        rs <- rep(0.0308, 6) * scale
    }
    mapply(star, xs, ys, rs, SIMPLIFY = FALSE)
}

drawStar <- function(s) {
    grid.polygon(x = s$x, y = s$y,
                 gp = gpar(col = "white", fill = "white"),
                 default.units = "inches")
}

star_rows <- c(1:9)
lapply(star_rows, function(row) {
    stars <- starsForRow(row)
    lapply(stars, drawStar)
})

grid.rect(gp = gpar(fill = NA))
