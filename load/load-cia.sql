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

-- add because the cnt columns were added after the fact
set work_mem to '1 GB';
update foiarchive.docs fd
    set (char_cnt, word_cnt, pg_cnt) =
        (select d.char_cnt, d.word_cnt, d.pages 
            from declassification_cia.docs_view d
            where d.doc_id = fd.doc_id)
    where corpus = 'cia';