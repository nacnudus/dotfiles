.First <- function() {
  options(
    repos = c(CRAN = "https://cran.rstudio.com/"),
    browserNLdisabled = TRUE,
    deparse.max.lines = 2)
}

if(interactive()){
  suppressMessages(library(colorout))
  suppressMessages(library(setwidth))
  suppressMessages(library(devtools))
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
    devtools.desc.author = 'person("Duncan", "Garmonsway", email = "duncan.garmonsway@gmail.com", role = c("aut", "cre"))'
    )
}
