-- steps to run before adding a large collection to foiarchive.docs
-- created specifically for the load of cia, un and worldbank in 2023-12
-- but should be generally applicable in the future

-- this was a one time operation executed on 12/9/2023
-- ALTER TABLE foiarchive.docs ALTER COLUMN full_text DROP EXPRESSION;
-- this a one time operation execute on 12/12/2023
alter table foiarchive.docs add column char_cnt integer;
alter table foiarchive.docs add column word_cnt integer;
alter table foiarchive.docs add column pg_cnt integer;
alter table foiarchive.docs add column doc_lang text;


-- drop the indices on foiarchive for quicker load
-- ABSOLUTELY CRITICAL these be recreated after the load 
-- as is done in after-load.sql
drop index docs$authored;
drop index docs$corpus;
drop index docs$full_text;
drop index docs$classification;
-- note: leave the primary key in place but rebuilding its index after the load 