if(interactive()){
  suppressMessages(library(colorout))
  suppressMessages(library(usethis))
  suppressMessages(library(devtools))
}

# Function to use all the visible columns in the terminal
setwidth <- function(howWide=Sys.getenv("COLUMNS")) {
  options(width=as.integer(howWide))
}

# Function to list un-covered lines of code in a package
coverage <- function() {
  x <- covr::package_coverage()
  covr::zero_coverage(x)
}

# Function to use all the visible columns in the terminal
print_tibble_inf <- function(.data) {
  tibble:::print.tbl_df(.data, n = Inf)
}

# Alias to install() without attempting to connect to the internet
install_offline <- function() {
  devtools::install(dependencies = FALSE, upgrade_dependencies = FALSE)
}

# Alias to install_offline()
i <- function() {
  install_offline()
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
    devtools.name = "Duncan Garmonsway",
    devtools.desc.author = 'person("Duncan", "Garmonsway", email = "duncan.garmonsway@gmail.com", role = c("aut", "cre"))',
    blogdown.rmd = TRUE
    )
}

options(Ncpus = 4)
options(pillar.bold = TRUE) # bold column headers
