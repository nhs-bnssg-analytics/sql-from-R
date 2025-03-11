

# 1 - connect to the server -----------------------------------------------

# gets me an object sql_con
source("./00-initial connection.R")

# 2 - pick the table ------------------------------------------------------

top_10 <- dbGetQuery(sql_con, "SELECT TOP 10 * FROM MODELLING_SQL_AREA.dbo.New_Cambridge_Score")
class(top_10) # a data frame within R

# PRO: get to use SQL syntax I am familiar with
# PRO: the hard work is done faster in SQL
# CON: not all functionality available
# CON: bringing big data sets into R takes time

