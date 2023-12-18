insert into docs (doc_id, corpus, classification, authored, title, body, source)
select id, 'pdb',
       case when origclass = 'T' then 'top secret'::classification_t
            when origclass = 'S' then 'secret'::classification_t
            when origclass = 'C' then 'confidential'::classification_t
       end,
       date, subject, body, pdf
from declassification_pdb.docs;

update foiarchive.docs 
   set char_cnt = length(body),
       word_cnt = (select count(*)
                      from ts_parse('default', body) t
                      where t.tokid = 1)
where corpus = 'pdb';

update foiarchive.docs fd
  set pg_cnt = (select page_count 
                     from declassification_pdb.docs p
                     where p.id = fd.doc_id)
  where corpus = 'pdb';