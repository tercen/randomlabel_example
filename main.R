library(tercen)
library(dplyr)

ctx = tercenCtx()

if(!ctx$op.value('seed') == "NULL") set.seed(as.integer(ctx$op.value('seed')))

data.frame(
  .ci = seq(from=0, to=ctx$cschema$nRows - 1),
  sample = runif(ctx$cschema$nRows, 0.0, 100.0)
) %>%
  ctx$addNamespace() %>%
  ctx$save()
  


