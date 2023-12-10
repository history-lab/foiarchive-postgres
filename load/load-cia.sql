-- alter type foiarchive.classification_t add value 'restricted';
-- alter type foiarchive.classification_t add value 'unknown';

insert into foiarchive.classifications  
    (classification, sensitivity_level) values
    ('restricted', 3),
    ('unknown', 6);

insert into foiarchive.docs (doc_id, corpus, authored, title, body, source, 
                             classification, full_text)
select doc_id, 'cia', authored, title, body, pdf, 
       classification::classification_t, fts 
from declassification_cia.docs_view;
