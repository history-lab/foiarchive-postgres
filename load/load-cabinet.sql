alter type foiarchive.corpus_t add value 'cabinet';

-- inserts 42359 rows
insert into foiarchive.docs (doc_id, corpus, authored, 
                             title, body, 
                             full_text, source, 
                             char_cnt, word_cnt)
select id, 'cabinet', date, 
       title, body,
       to_tsvector('english',  title || ' ' || coalesce(body, '')) full_text,
       pdf source,
       length(body) char_cnt, 
       (select count(*)
              from ts_parse('default', body) t
              where t.tokid = 1) word_cnt  
from declassification_cabinet.docs;


