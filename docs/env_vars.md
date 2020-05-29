# Environment Variables

**DB_HOST:** The domain for the database, falls back to `localhost`

**DB_USERNAME:** The username used for connections to the DB, falls back to `postgres`

**DB_PORT:** The port on the `DB_HOST` that is used to forge a connection to the DB, falls back to the `pg` default `5432`

**DB_PASSWORD:** The password used for connections to the DB, falls back to `notinproduction` - **this value should not be used in production!**
