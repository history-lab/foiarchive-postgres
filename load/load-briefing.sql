delete from foiarchive.docs where corpus = 'pdb';
-- alter type foiarchive.corpus_t drop value 'pdb';
--
-- alter type foiarchive.corpus_t add value 'briefing';
alter type foiarchive.corpus_t rename value 'pdb' to 'briefing';

insert into foiarchive.docs (doc_id, corpus, classification, authored, title, 
                             body, char_cnt, word_cnt, pg_cnt, source)
select id, 'briefing'::corpus_t,
       case when origclass = 'T' then 'top secret'::classification_t
            when origclass = 'S' then 'secret'::classification_t
            when origclass = 'C' then 'confidential'::classification_t
       end,
       doc_date, title, body, length(body) char_cnt,
       (select count(*) 
          from ts_parse('default', body) t 
          where t.tokid = 1) word_cnt, pg_cnt,
       file 
from declassification_pdb_test.docs;
