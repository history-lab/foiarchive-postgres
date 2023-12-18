insert into docs (doc_id, corpus, classification, authored, title, body)
select id, 'kissinger', NULL, date, title, body
from declassification_kissinger.docs;

-- validate countries
-- countries same as frus
insert into countries_docs (country_id, doc_id)
select encode(country_id, 'escape'), doc_id
from declassification_kissinger.country_doc;

insert into persons(person_id, full_name, birth_year, death_year, description)
select concat('kiss', id::text), encode(name, 'escape'), NULL, NULL, description
from declassification_kissinger.persons;

insert into persons_docs(person_id, doc_id)
select concat('kiss', person_id::text), doc_id
  from declassification_kissinger.person_doc;

insert into topics (topic_id, title, topic_name)
select concat('kiss', id::text), title, name
from  declassification_kissinger.topics;

insert into topics_docs (topic_id, doc_id)
select concat('kiss', topic_id::text), doc_id
from declassification_kissinger.topic_doc;

update foiarchive.docs 
   set char_cnt = length(body),
       word_cnt = (select count(*)
                      from ts_parse('default', body) t
                      where t.tokid = 1)
where corpus = 'kissinger';