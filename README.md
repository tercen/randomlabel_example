# Median operator

##### Description

The `Random label` operator returns a random label per column. It allows one to subsample or downsample the data.

##### Usage

Input projection|.
---|---
`col`        | numeric, input data, per cell 

Output relations|.
---|---
`label`        | numeric, median of the input data

##### Details

The operator takes all the values of a cell and returns the value which is the median.The computation is done per cell. There is one value returned for each of the input cell.

#### References


##### See Also


