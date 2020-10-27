create or replace view corpora as
select corpus, count(doc_id) doc_cnt
   from docs
   group by corpus;

create or replace view entities(entity_type, entity_name, corpus, ref_cnt) as
select 'country', country_name, corpus, count(cd.doc_id)
from countries c join countries_docs cd on cd.country_id = c.country_id
                 join docs d on cd.doc_id = d.doc_id
group by rollup(country_name, corpus)
union all
select 'person', full_name, corpus, count(pd.doc_id)
from persons p join persons_docs pd on pd.person_id = p.person_id
               join docs d on pd.doc_id = d.doc_id
group by rollup(full_name, corpus)
union all
select 'topic', topic_name, corpus, count(td.doc_id)
from topics t join topics_docs td on td.topic_id = t.topic_id
              join docs d on td.doc_id = d.doc_id
group by rollup(topic_name, corpus);
