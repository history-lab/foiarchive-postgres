insert into docs (doc_id, corpus, classification, authored, title, body)
select id, 'frus', lower(classification)::classification_t, date,
       coalesce(title, 'No Title - Document Id: ' || id), raw_body
from declassification_frus.docs;

insert into docs_frus (doc_id, chapt_title, volume_id, doc_source,
                       authored_location, sent_from, sent_to, title_docview,
                       subject, body)
select id, chapt_title, volume_id, source, location,
       p_from, p_to, title_docview, subject, body
from declassification_frus.docs;

insert into persons(person_id, full_name, birth_year, death_year, description)
select id, name, birth_year, death_year, description
from declassification_frus.persons;

insert into persons_docs(person_id, doc_id)
select person_id, doc_id
  from declassification_frus.person_doc;

insert into countries (country_id, country_name, deleted, official)
select encode(id, 'escape'), name, deleted, official
from declassification_frus.countries;

insert into countries_docs (country_id, doc_id)
select encode(country_id, 'escape'), doc_id
from declassification_frus.country_doc;

insert into topics (topic_id, title, topic_name)
select id, title, name
from  declassification_frus.topics;

insert into topics_docs (topic_id, doc_id)
select topic_id, doc_id
from declassification_frus.topic_doc;

insert into volumes (volume_id, title_series, title_subseries, title_volnum,
                     title_vol, editors, publication_year, publication_location,
                     preface, sources)
select id, title_series, title_subseries, title_volnum, title_vol,
       editors, substr(date, 1, 4)::integer, location, preface, sources
from declassification_frus.volumes;

update foiarchive.docs 
   set char_cnt = length(body),
       word_cnt = (select count(*)
                      from ts_parse('default', body) t
                      where t.tokid = 1)
where corpus = 'frus';
