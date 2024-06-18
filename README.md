# Preparation
First, spin up the Postgres database using Docker
```
docker compose -f docker-compose.yml up
```

Then populate the `datawarehouse` database using data from this site https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/

If this is the first time we are using dbt, we may need to run the command `dbt init` to initialise the dbt project folder structure.

We can test the connection, defined at the file `profiles.yml` by running the command `dbt debug`

Since we make use of additional dbt packages, namely `dbt_utils` and `dbt_date`, we need to download them beforehand by running `dbt deps`

# Transformation
Simulated operational data is in the `datawarehouse`'s `public` schema. By using dbt, we are able to transform these tables into dim and fact tables, which reside in a `dbt_schema_marts` schema. We also make use of staging views at `dbt_schema_staging` to read from source data and perform minor adjustments.

If the transformation process is too complex, we may need to make use of additional intermediate views. Luckily, for this demonstration, going straight to marts is quite simple.

To run the transformation, simple run the command `dbt run`

# Testing
If we specficially want to test, use the command `dbt test`. We can also combine running and testing by running a single command `dbt build`

# Documentation and clean up
dbt offers a clean overview of what to be expected given all our defined sql files. By running `dbt docs generate` and `dbt doc server`, we can view these documentations on the local web browser.

Finally, we can clean up dbt generated files and logs by running `dbt clean`
