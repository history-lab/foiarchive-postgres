insert into docs (doc_id, corpus, classification, authored, title, body, source)
select id, 'pdb',
       case when origclass = 'T' then 'top secret'::classification_t
            when origclass = 'S' then 'secret'::classification_t
            when origclass = 'C' then 'confidential'::classification_t
       end,
       date, subject, body, pdf
from declassification_pdb.docs;
