insert into docs (doc_id, corpus, classification, authored, title, body)
select id, 'cfpf',
       case when lower(classification) in
                 ('top secret','secret','confidential', 'unclassified',
                  'limited official use') then
                      lower(classification)::classification_t
            else null
        end,
        date, coalesce(title, 'No Title - Document Id: ' || id),
              coalesce(body,  'No Text Body Available for Document')
from declassification_cables.docs;

insert into persons(person_id, full_name, birth_year, death_year, description)
select id, name, birth_year, death_year, description
from declassification_cables.persons;

insert into persons_docs(person_id, doc_id)
select person_id, doc_id
  from declassification_cables.person_doc;

insert into countries (country_id, country_name, deleted, official)
select encode(id, 'escape'), name, deleted, official
from declassification_cables.countries dc
where not exists (select 1
                  from foiarchive.countries fa
                  where fa.country_id = encode(dc.id, 'escape'));

insert into countries_docs (country_id, doc_id)
select encode(country_id, 'escape'), doc_id
from declassification_cables.country_doc;

insert into topics (topic_id, title, topic_name)
select id, title, name
from  declassification_cables.topics;

insert into topics_docs (topic_id, doc_id)
select topic_id, doc_id
from declassification_cables.topic_doc;

insert into cfpf_concepts(cfpf_concept_id, concept_name)
select id, name
from declassification_cables.concepts;

insert into cfpf_concepts_docs(cfpf_concept_id, doc_id)
select distinct concept_id, doc_id
from declassification_cables.concept_doc;

insert into cfpf_offices(cfpf_office_id, office_code)
select encode(id, 'escape'), office
from declassification_cables.offices;

insert into cfpf_offices_docs(cfpf_office_id, doc_id)
select distinct encode(office_id, 'escape'), doc_id
from declassification_cables.office_doc;

insert into cfpf_tags(cfpf_tag_id, tag, title, description, tag_class,
                       category, tag_action)
select id, tag, title, description, class, category, action
from declassification_cables.tags;

insert into cfpf_tags_docs(cfpf_tag_id, doc_id)
select tag_id, doc_id
from declassification_cables.tag_doc;

insert into cfpf_urgencies(cfpf_urgency_id, urgency_code)
select id, urgency
from declassification_cables.urgency;

insert into cfpf_urgencies_docs(cfpf_urgency_id, doc_id)
select urgency_id, doc_id
from declassification_urgency_doc;



--insert into docs_cfpf (doc_id, chapt_title, volume_id, doc_source,
--                       authored_location, sent_from, sent_to, title_docview,
--                       subject, body)
--select id, chapt_title, volume_id, source, location,
--       p_from, p_to, title_docview, subject, body
--from declassification_cables.docs;
