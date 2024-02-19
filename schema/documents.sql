create or replace view documents as
with countries_list (doc_id, countries) as
        (select cd.doc_id,
            array_agg(c.country_name order by c.country_name) countries
         from countries c natural join countries_docs cd
         group by doc_id),
     persons_list (doc_id, persons, person_ids) as
        (select pd.doc_id,
            array_agg(p.full_name order by p.full_name),
            array_agg(p.person_id order by p.full_name)
         from persons p natural join persons_docs pd
         group by doc_id),
     topics_list (doc_id, topics, topic_ids) as
        (select td.doc_id,
            array_agg(t.topic_name order by t.topic_name),
            array_agg(t.topic_id order by t.topic_name)
         from topics t natural join topics_docs td
         group by doc_id)
select d.doc_id, corpus, classification, authored, title, cl.countries,
    pl.persons, pl.person_ids, tl.topics, tl.topic_ids,
    body, full_text
from docs d left join countries_list cl on d.doc_id = cl.doc_id
            left join persons_list pl on d.doc_id = pl.doc_id
            left join topics_list tl on d.doc_id = tl.doc_id;
grant select on foiarchive.documents to web_anon;

