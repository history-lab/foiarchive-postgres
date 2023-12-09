alter table declassification_cia.docs add column fts tsvector;
update declassification_cia.docs
    set fts = to_tsvector('english', 
                          coalesce(title, '') || ' ' || body  || 
                          ' doc_id: ' || id)
    where char_cnt <= 1048575;
-- count because we are excluding some of the really big docs
-- alter table declassification_cia.docs alter column fts set not null;
-- set working memory 1GB

select now();
SET maintenance_work_mem TO '1 GB';
create index on declassification_cia.docs using gin (fts);
