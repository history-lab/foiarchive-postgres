-- replace frus-only foiarchive tables with views on declassification_frus
-- this should be one time switch
drop table foiarchive.docs_frus;
\i docs_frus.sql
drop table foiarchive.volumes;
\i volumes.sql

\i ../../load/before-load.sql  -- run manually
-- 
delete from foiarchive.docs where corpus = 'frus';
insert into docs (doc_id, corpus, 
                  classification, authored, 
                  title, body,
                  char_cnt, word_cnt, pg_cnt, 
                  full_text)
select fd.id, 'frus', 
       lower(coalesce(fd.classification, 'unknown'))::classification_t, fd.date,
       coalesce(fd.title, 'No Title - Document Id: ' || fd.id), fd.raw_body, 
       length(fd.raw_body) char_cnt,
       (select count(*) 
          from ts_parse('default', fd.raw_body) t 
          where t.tokid = 1) word_cnt, fd.num_pages pg_cnt,
       to_tsvector('english', coalesce(fd.title, '') || ' ' || 
                              coalesce(fd.body, '')  || ' ' ||
                              coalesce(fd.chapt_title, '') || ' ' ||
                              coalesce(fd.subject, '') || ' ' ||
                              coalesce(fd.source, '') || ' ' ||
                              'DOC ID: ' || fd.id || ' ' ||
                              coalesce('SUBTYPE: ' || fd.subtype, '')) full_text
    from declassification_frus.docs fd;

\i ../../load/after-load.sql  -- run manually
-- fix titles