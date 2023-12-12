-- alter type foiarchive.classification_t add value 'restricted';
alter type foiarchive.corpus_t add value 'un';
--
alter type foiarchive.classification_t add value 'strictly confidential';
alter type foiarchive.classification_t add value 'no security level';
insert into foiarchive.classificatons (classification, sensitivity_level)
values ('no security level', 6),
       ('strictly confidential', 2);
--
insert into foiarchive.docs (doc_id, corpus, authored, title, body, 
                             full_text, source, classification, 
                             char_cnt, word_cnt, pg_cnt)
select doc_id, 'un', doc_date, title, body,
       to_tsvector('english',  coalesce(title, '') || ' ' || body  || 
                   ' un_id: ' || un_id) full_text,
       pdf_url, classification::classification_t, 
       char_cnt, word_cnt, pg_cnt 
from un_archives.docs;


