
# source a SQL script
con_string <- c(paste0(
  "driver={SQL Server};server=",
  Sys.getenv("Server"),
  ".xswhealth.nhs.uk;database=Modelling_SQL_AREA;trusted_connection=true"))

con <-  RODBC::odbcDriverConnect(con_string, rows_at_time = 1)


my_data <- RODBC::sqlQuery(con,query = readr::read_file(
  "./my-sql-script.sql"),stringsAsFactors = FALSE)
class(my_data) # a data frame in R
