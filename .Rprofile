if(interactive()){
    library(colorout)
    library(setwidth)
    library(vimcom.plus)
    # If you can't install the vimcom.plus package, do:
    # library(vimcom)
}
options(repos = c(CRAN = "http://cran.rstudio.com"))

myjekyllsite <- "http://nacnudus.github.io/crosstab-kiwi/"

KnitPost <- function(input, base.url = myjekyllsite) {
    require(knitr)
    opts_knit$set(base.url = base.url)
    fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    render_jekyll()
    knit(input, envir = parent.frame())
}
