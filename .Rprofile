if(interactive()){
  suppressMessages(library(colorout))
  suppressMessages(library(devtools))
}

# Function to use all the visible columns in the terminal
setwidth <- function(howWide=Sys.getenv("COLUMNS")) {
  options(width=as.integer(howWide))
}

utils::assignInNamespace(
  "q",
  function(save = "no", status = 0, runLast = TRUE)
  {
    .Internal(quit(save, status, runLast))
  },
  "base"
)

.First <- function() {
  options(
    repos = c(CRAN = "https://cran.rstudio.com/"),
    browserNLdisabled = TRUE,
    deparse.max.lines = 2,
    devtools.name = "Duncan Garmonsway",
    devtools.desc.author = 'person("Duncan", "Garmonsway", email = "duncan.garmonsway@gmail.com", role = c("aut", "cre"))',
    blogdown.rmd = TRUE
    )
}
