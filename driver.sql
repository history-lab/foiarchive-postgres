-- assumes pgloader has been run with the command script frus.pgl
create schema foiarchive;
set search_path to foiarchive, "$user", public;
-- enum experiment
\i types.sql
-- create base tables
\i tables.sql
-- populate tables
\i transform.sql
-- add constraints
\i constraints.sql
-- add indexes
\i indexes.sql
