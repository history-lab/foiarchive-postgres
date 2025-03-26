create or replace view foiarchive.documents as
select d.doc_id, d.corpus, classification, authored, d.title,
       body, full_text, 
       ta.topic_names, ta.topic_titles, ta.topic_scores, ta.topic_ids,
       ea.entities, ea.entgroups, ea.wikidata_ids, ea.entity_ids
from foiarchive.docs d left join lateral (
     select array_agg(t.name order by td.score desc) topic_names,
            array_agg(t.title order by td.score desc) topic_titles,
            array_agg(td.score order by td.score desc) topic_scores,
            array_agg(t.topic_id order by td.score desc) topic_ids
         from foiarchive.topics t join foiarchive.topic_docs td 
                                    on t.topic_id = td.topic_id and 
                                       t.corpus = td.corpus
         where td.doc_id = d.doc_id and td.corpus = d.corpus
         group by td.doc_id) as ta on TRUE
                      left join lateral (
     select array_agg(e.entity order by e.entity) entities,
            array_agg(e.entgroup order by e.entity) entgroups,
            array_agg(e.wikidata_id order by e.entity) wikidata_ids,
            array_agg(e.entity_id order by e.entity) entity_ids
         from foiarchive.entities e join foiarchive.entity_docs ed 
                                       on e.entity_id = ed.entity_id
         where ed.doc_id = d.doc_id) as ea on TRUE;
grant select on foiarchive.documents to web_anon;
comment on view foiarchive.documents is 'Docs view with entities and topics lists. Used by the R API';

create index on foiarchive.entity_docs(doc_id); -- performance reasons