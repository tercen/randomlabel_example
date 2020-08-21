# Random label operator

##### Description

The `Random label` operator returns a random label per column.

##### Usage

Input projection|.
---|---
`column`        | input data, per cell 

Output relations|.
---|---
`label`        | numeric, random number between 0 and 100

Parameters|.
---|---
`seed`        |  random seed

##### Details

The `Random label` operator can be used to randomly sample data. A number is sampled from a uniform distribution U(0, 100) and assigned to each column.

##### See Also

[downsample_operator](https://github.com/tercen/downsample_operator/)
