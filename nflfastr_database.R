install.packages("gsisdecoder")
library(DBI)
library(RPostgres)
library(nflfastR)
library(gsisdecoder)

future::plan("multisession")

conn <- DBI::dbConnect(RPostgres::Postgres(),
                       dbname = Sys.getenv("DB_NAME"),
                       host = Sys.getenv("DB_HOST"),
                       port = Sys.getenv("DB_PORT"),
                       user = Sys.getenv("DB_USER"),
                       password = Sys.getenv("DB_PASSWORD"))

update_db(db_connection = conn, tblname = "nflfastr_pbp", force_rebuild = FALSE)
