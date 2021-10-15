library(tercen)
library(dplyr)

ctx <- tercenCtx()

seed <- NULL
if(!ctx$op.value('seed') < 0) seed <- as.integer(ctx$op.value('seed'))

data.frame(
  .ci = seq(from=0, to=ctx$cschema$nRows - 1),
  random_label = runif(ctx$cschema$nRows, 0.0, 100.0)
) %>%
  ctx$addNamespace() %>%
  ctx$save()
  


