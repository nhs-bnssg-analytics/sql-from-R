
# 1 - connect to the server -----------------------------------------------

# gets me an object sql_con
source("./00-initial connection.R")

# 2 - pick the table ------------------------------------------------------

# packages dplyr for data wrangling and dbplyr for SQL wrangling in same syntax
library(dplyr)
library(dbplyr)

source_new_cambridge_score <- tbl(sql_con,
                                  in_schema(
                                    sql("MODELLING_SQL_AREA"),
                                    sql("dbo.New_Cambridge_Score"))
)
# the work is being done in SQL and brought back - quirks such as don't know
# number of rows from this command
source_new_cambridge_score |> glimpse()

# get number of rows in the table
source_new_cambridge_score |> count()

# quicker(?) to perform manipulations in SQL then bring through finished product
# to R
monthly_tbl <- source_new_cambridge_score |>
  count(attribute_period, sex) |>
  collect()

#monthly_tbl <-
source_new_cambridge_score |>
  count(attribute_period, sex) |>
  show_query()

# Note monthly_tbl is now within R
monthly_tbl |> glimpse()

class(monthly_tbl)
class(source_new_cambridge_score)

# PRO: get to use dplyr syntax I am familiar with
# PRO: the hard work is done faster in SQL
# CON: not all functionality available
# CON: bringing big data sets into R takes time
