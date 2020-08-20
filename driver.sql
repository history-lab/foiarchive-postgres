create schema foiarchive;
set search_path to foiarchive, public;
-- enum experiment
\i types.sql
-- create base tables
\i tables.sql
-- populate tables
-- add constraints
\i constraints.sql
-- add indexes
\i indexes.sql
