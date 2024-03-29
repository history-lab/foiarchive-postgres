drop view if exists foiarchive.docs_frus;
create or replace view foiarchive.docs_frus as 
    select id::id_d doc_id, volume_id, chapt_title, title, title_docview, 
           subject, date authored, location, p_from, p_to, source, classification,
           body, raw_body, /* collection, - always 'frus' */ subtype, num_pages  
        from declassification_frus.docs;
grant select on foiarchive.docs_frus to web_anon;