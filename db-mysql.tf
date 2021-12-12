resource "google_sql_database_instance" "instance" {
  name             = "wp-mysql-04"
  database_version = "mysql_5_7"
  region           = "us-central1"
  deletion_protection = "false"
  settings {
    tier = "db-f1-micro"

  }
}



resource "google_sql_database" "database" {
  name     = "wp-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "usuario" {
  name     = "admin"
  password = "admin123"
  instance = google_sql_database_instance.instance.name
}