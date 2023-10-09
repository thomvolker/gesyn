
library(ggplot2)

set.seed(123)

x_real <- rnorm(200)
x_syn  <- rnorm(200)

d_real <- density(x_real)
d_syn  <- density(x_syn)

hexSticker::sticker(
  ggplot() +
    geom_line(aes(x = d_real$x, y = d_real$y, linetype = "Real"), size = 0.5, col = "#d8e5e8") +
    geom_line(aes(x = d_syn$x, y = d_syn$y, linetype = "Synthetic"), size = 0.5, col = "#d8e5e8") +
    theme_void() +
    hexSticker::theme_transparent() +
    theme(panel.background = element_rect(fill = 'transparent'),
          plot.background = element_rect(fill = "transparent"),
          legend.position = 'none') +
    #guides(linetype = guide_legend(title = NULL, override.aes = list(linetype = 0))) +
    xlim(-4, 4),
  package = "gesyn",
  p_size = 22, s_x = 0.97, s_y = 1.2, s_width = 1.8, s_height = 1.2,
  h_fill = "#034e57", h_color = "#93effa", p_color = "#de0277",
  p_y = 0.5,
  filename = "content/lectures/files/logo.png"
)
