alter type foiarchive.corpus_t add value 'cpdoc';
-- inserts 10279 rows
insert into foiarchive.docs (doc_id, corpus, authored, 
                             title, body, 
                             full_text, source, doc_lang,
                             char_cnt, word_cnt)
select id, 'cpdoc', date, 
       title, body,
       to_tsvector('portuguese',  title || ' ' || coalesce(body, '')) full_text,
       pdf source, main_language doc_lang,
       length(body) char_cnt, 
       (select count(*)
              from ts_parse('default', body) t
              where t.tokid = 1) word_cnt  
from declassification_cpdoc.docs;


