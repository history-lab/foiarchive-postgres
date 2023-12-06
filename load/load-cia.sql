alter type foiarchive.classification_t add value 'restricted';
alter type foiarchive.classification_t add value 'unknown';

-- insert into foiarchive.docs (doc_id, corpus, authored, title, body, source, 
--                             classification)
-- select doc_id, 'cia', authored, title, body, pdf, 
--       classification::classification_t 
-- from declassification_cia.docs_view
--where length(body) <= 1048575;
