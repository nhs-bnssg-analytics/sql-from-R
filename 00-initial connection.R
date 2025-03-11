

# 1 - connect to the database ---------------------------------------------

# uses DBI and odbc packages - gives you view within R
library(DBI)
library(odbc)

# I use a function from a package I made (will error if on diff machine)
DPMmicrosim:::get_sql_con()

# under the hood it is this
get_sql_con <- function (server = NA)
{
  if (is.na(server)) {
    server = Sys.getenv("Server")
    if(server==""){stop("need to have a server name")}
  }
  sql_con <- DBI::dbConnect(odbc::odbc(),
                            Driver = "SQL Server",
                            Server = server,
                            Database = "MODELLING_SQL_AREA",
                            Trusted_Connection = "True",
                            timeout = 120)
  return(sql_con)
}

# the Server name is saved in my .Renviron file so I don't have to commit it
# as code.
# to change your .Renviron file try usethis::edit_r_environ()

sql_con <- get_sql_con()
