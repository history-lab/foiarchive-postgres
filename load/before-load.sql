-- steps to run before adding a large collection to foiarchive.docs
-- created specifically for the load of cia, un and worldbank in 2023-12
-- but should be generally applicable in the future

-- this was a one time operation executed on 12/9/2023
-- ALTER TABLE foiarchive.docs ALTER COLUMN full_text DROP EXPRESSION;
-- this a one time operation execute on 12/12/2023
-- alter table foiarchive.docs add column char_cnt integer;
-- alter table foiarchive.docs add column word_cnt integer;
-- alter table foiarchive.docs add column pg_cnt integer;
-- alter table foiarchive.docs add column doc_lang text;


-- drop the indices on foiarchive for quicker load
-- ABSOLUTELY CRITICAL these be recreated after the load 
-- as is done in after-load.sql
drop index foiarchive.docs_authored_idx;
drop index foiarchive.docs_corpus_idx;
drop index foiarchive.docs_full_text_idx;
drop index foiarchive.docs_classification_idx;
-- note: leave the primary key in place but rebuilding its index after the load is a good idea
--    TABLE "cfpf_concepts_docs" CONSTRAINT "cfpf_concepts_docs_doc_id_fkey" FOREIGN KEY (doc_id) REFERENCES docs(doc_id)
--    TABLE "cfpf_offices_docs" CONSTRAINT "cfpf_offices_docs_doc_id_fkey" FOREIGN KEY (doc_id) REFERENCES docs(doc_id)
--    TABLE "cfpf_tags_docs" CONSTRAINT "cfpf_tags_docs_doc_id_fkey" FOREIGN KEY (doc_id) REFERENCES docs(doc_id)
--    TABLE "countries_docs" CONSTRAINT "countries_docs_doc_id_fkey" FOREIGN KEY (doc_id) REFERENCES docs(doc_id)
--    TABLE "docs_cfpf" CONSTRAINT "docs_cfpf_doc_id_fkey" FOREIGN KEY (doc_id) REFERENCES docs(doc_id)
--    TABLE "docs_clinton" CONSTRAINT "docs_clinton_doc_id_fkey" FOREIGN KEY (doc_id) REFERENCES docs(doc_id)
alter TABLE "cfpf_concepts_docs" drop CONSTRAINT if exists "cfpf_concepts_docs_doc_id_fkey"; 
alter TABLE "cfpf_offices_docs" drop CONSTRAINT if exists "cfpf_offices_docs_doc_id_fkey";
alter TABLE "cfpf_tags_docs" drop CONSTRAINT if exists "cfpf_tags_docs_doc_id_fkey";
alter TABLE "countries_docs" drop CONSTRAINT if exists "countries_docs_doc_id_fkey";
alter TABLE "docs_cfpf" drop CONSTRAINT if exists "docs_cfpf_doc_id_fkey";
alter TABLE "docs_clinton" drop CONSTRAINT if exists "docs_clinton_doc_id_fkey";


alter TABLE persons_docs drop CONSTRAINT if exists persons_docs_doc_id_fkey;
alter TABLE topic_docs drop CONSTRAINT if exists topic_docs_doc_id_fkey;
alter TABLE topic_docs drop CONSTRAINT if exists topic_docs_doc_id_fkey1;