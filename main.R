library(tercen)
library(dplyr)

ctx = tercenCtx()

do.unifsampling <- FALSE
do.downsampling <- TRUE

if(ctx$op.value('method') == "uniform") do.unifsampling <- TRUE
if(ctx$op.value('method') == "downsampling") do.downsampling <- TRUE

if(!ctx$op.value('seed') == "NULL") set.seed(as.integer(ctx$op.value('seed')))

if(do.unifsampling) {
  
  data.frame(
    .ci = seq(from=0, to=ctx$cschema$nRows - 1),
    sample = runif(ctx$cschema$nRows, 0.0, 100.0)
  ) %>%
    
    ctx$addNamespace() %>%
    ctx$save()
  
} else if(do.downsampling) {
  
  downSample <- function (.ci, y) {
    
    df <- data.frame(.ci, y = as.factor(y))
    
    minClass <- min(table(y))
    df$label <- 0
    
    df <- ddply(df, .(y), function(dat, n) {
      dat[sample(seq(along = dat$y),  n), "label"] <- 1
      return(dat)
    }, n = minClass)
    df$label <- as.factor(df$label)
    
    return(df)
  }
  
  library(plyr)
  
  .ci <- c(ctx$select(".ci")[[1]])
  y <- c(as.factor(ctx$select(".colorLevels")[[1]]))
  y <- y[!duplicated(.ci)]
  .ci <- .ci[!duplicated(.ci)]
  df <- downSample(.ci, y)
  df %>%
    ctx$addNamespace() %>%
    ctx$save()
  
} else {
  stop("Wrong sampling method.")
}

