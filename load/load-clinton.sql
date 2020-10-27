insert into docs (doc_id, corpus, classification, authored, title, body)
select id, 'clinton', lower(classification)::classification_t, date,
        case when title is null or trim(title)= '' or title !~ '\w'
             then concat('Hillary Clinton Emails: Case No. ', case_num,
                         ' Doc No. ',
                         substring(full_path
                                     from '%#"[[:alnum:]]*#".pdf' for '#'))
             else title
         end,
        body
from declassification_clinton.docs;

insert into docs_clinton (doc_id, thread_id, message_num, doc_batch,
                       author, posted_date, declass_date, reason,
                       source_url, original_url)
select id, thread_id, message_num, doc_class,
       author, posted_date, NULL, reason,
       pdf, pdf_url
from declassification_clinton.docs;

insert into persons(person_id, full_name, birth_year, death_year, description)
select concat('hrc', id::text), encode(name, 'escape'), NULL, NULL, description
from declassification_clinton.persons;

insert into persons_docs(person_id, doc_id)
select concat('hrc', person_id::text), doc_id
  from declassification_clinton.person_doc;

-- countries same as frus
insert into countries_docs (country_id, doc_id)
select encode(country_id, 'escape'), doc_id
from declassification_clinton.country_doc;

-- topics tbd
-- insert into topics (topic_id, title, topic_name)
-- select id, title, name
-- from  declassification_frus.topics;

-- insert into topics_docs (topic_id, doc_id)
-- select topic_id, doc_id
-- from declassification_frus.topic_doc;
