-- steps to run before adding a large collection to foiarchive.docs
-- created specifically for the load of cia, un and worldbank in 2023-12
-- but should be generally applicable in the future

-- think this is a one time operation


-- drop the indices on foiarchive for quicker load
-- ABSOLUTELY CRITICAL these be recreated after the load 
-- as is done in after-load.sql
drop index docs$authored;
drop index docs$corpus;
drop index docs$full_text;
-- note: leave the primary key in place but rebuilding its index after the load 