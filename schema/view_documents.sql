create or replace view documents as
select d.doc_id, corpus, classification, authored, title,
       array_agg(c.country_name order by c.country_name) countries,
       array_agg(p.full_name order by p.full_name)       persons,
       body, full_text
from docs d left join countries_docs cd on d.doc_id = cd.doc_id
            left join countries c on cd.country_id = c.country_id
            left join persons_docs pd on d.doc_id = pd.doc_id
            left join persons p on pd.person_id = p.person_id
group by d.doc_id;


create or replace view documents as
with countries_list (doc_id, countries) as
        (select cd.doc_id,
            array_agg(c.country_name order by c.country_name) countries
         from countries c natural join countries_docs cd
         group by doc_id),
     persons_list (doc_id, persons) as
        (select pd.doc_id,
            array_agg(p.full_name order by p.full_name)
         from persons p natural join persons_docs pd
         group by doc_id),
     topics_list (doc_id, topics) as
        (select td.doc_id,
            array_agg(t.topic_name order by t.topic_name)
         from topics t natural join topics_docs td
         group by doc_id)
select d.doc_id, corpus, classification, authored, title,
    cl.countries, pl.persons, tl.topics,
    body, full_text
from docs d left join countries_list cl on d.doc_id = cl.doc_id
            left join persons_list pl on d.doc_id = pl.doc_id
            left join topics_list tl on d.doc_id = tl.doc_id;
