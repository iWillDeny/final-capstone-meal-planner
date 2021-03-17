#!/bin/bash
BASEDIR=$(dirname $0)
DATABASE=meal_planner
export PGPASSWORD='postgres1'

psql -U postgres -f "$BASEDIR/01_drop_and_create_db.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/03_create_table_schema.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/04_insert_seed_data.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/05_create_database_users.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/insert_recipe_seed_data.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/insert_ingredient_seed_data.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/insert_meal_plan_seed_data.sql"

