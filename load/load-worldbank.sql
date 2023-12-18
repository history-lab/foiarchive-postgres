alter type foiarchive.corpus_t add value 'worldbank';
-- 1071 have no body
alter table foiarchive.docs alter column body drop not null;

insert into foiarchive.docs (doc_id, corpus, authored, 
                             title, body, 
                             full_text, source, classification, 
                             char_cnt, word_cnt, pg_cnt)
select id, 'worldbank', to_date(substr(eventstartdates, 1, 10), 'YYYY-MM-DD'), 
       title, body,
       to_tsvector('english',  title || ' ' || coalesce(body, '')) full_text,
       pdf source, null::classification_t classification, 
       length(body) char_cnt, 
       (select count(*)
              from ts_parse('default', body) t
              where t.tokid = 1) word_cnt, 1 pg_cnt  
from declassification_worldbank.docs;


