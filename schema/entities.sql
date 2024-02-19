create or replace view foiarchive.entities(entity_type, entity_id, entity_name, corpus, ref_cnt) as
select 'country', c.country_id, c.country_name, cdr.corpus, cdr.ref_cnt
from foiarchive.countries c join
     (select cd.country_id, d.corpus, count(cd.doc_id) ref_cnt
      from foiarchive.countries_docs cd 
          join foiarchive.docs d on cd.doc_id = d.doc_id
      group by rollup(cd.country_id, d.corpus)) cdr
     on c.country_id = cdr.country_id
union all
select 'person', p.person_id, p.full_name, pdr.corpus, pdr.ref_cnt
from foiarchive.persons p join
     (select pd.person_id, d.corpus, count(d.doc_id) ref_cnt
      from foiarchive.persons_docs pd join foiarchive.docs d on pd.doc_id = d.doc_id
      group by rollup(pd.person_id, d.corpus)) pdr
     on p.person_id = pdr.person_id
union all
select 'topic', t.topic_id, t.topic_name, tdr.corpus, tdr.ref_cnt
from foiarchive.topics t join
     (select td.topic_id, d.corpus, count(d.doc_id) ref_cnt
      from  foiarchive.topics_docs td join foiarchive.docs d on td.doc_id = d.doc_id
      group by rollup(td.topic_id, corpus)) tdr
     on t.topic_id = tdr.topic_id;
grant select on foiarchive.entities to web_anon;