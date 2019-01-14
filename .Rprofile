if(interactive()){
  # suppressMessages(suppressWarnings(require(conflicted)))
  suppressMessages(library(colorout))
  suppressMessages(library(usethis))
  suppressMessages(library(devtools))
}

options(menu.graphics = FALSE)

# Secure download of packages via https
options(download.file.method = "libcurl")

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
  tibble:::print.tbl(.data, n = Inf)
}

# Alias to install() without attempting to connect to the internet
install_offline <- function() {
  devtools::install(dependencies = FALSE, upgrade = "never")
}

# Alias to install_offline()
i <- install_offline

# Alias to load_all()
l <- load_all

# Alias for the last result to be calculated
makeActiveBinding(".", function() .Last.value, env = .GlobalEnv)

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
