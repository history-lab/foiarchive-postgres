alter table docs add primary key (doc_id);

alter table persons add primary key (person_id);

alter table persons_docs add primary key (person_id, doc_id);
alter table persons_docs add foreign key (person_id) references persons;
alter table persons_docs add foreign key (doc_id) references docs;

alter table countries add primary key (country_id);

alter table countries_docs add primary key (country_id, doc_id);
alter table countries_docs add foreign key (country_id) references countries;
alter table countries_docs add foreign key (doc_id) references docs;

alter table topics add primary key (topic_id);

alter table topics_docs add primary key (topic_id, doc_id);
alter table topics_docs add foreign key (topic_id) references topics;
alter table topics_docs add foreign key (doc_id) references docs;

alter table volumes add primary key (volume_id);

alter table docs_frus add primary key (doc_id);
alter table docs_frus add foreign key (doc_id) references docs;
alter table docs_frus add foreign key (volume_id) references volumes;

alter table docs_clinton add primary key (doc_id);
alter table docs_clinton add foreign key (doc_id) references docs;

alter table docs_cfpf add primary key (doc_id);
alter table docs_cfpf add foreign key (doc_id) references docs;

alter table cfpf_concepts add primary key (cfpf_concept_id);

alter table cfpf_concepts_docs add primary key (cfpf_concept_id, doc_id);
alter table cfpf_concepts_docs add foreign key (cfpf_concept_id)
   references cfpf_concepts;
alter table cfpf_concepts_docs add foreign key (doc_id) references docs;

alter table cfpf_offices add primary key (cfpf_office_id);

alter table cfpf_offices_docs add primary key (cfpf_office_id, doc_id);
alter table cfpf_offices_docs add foreign key (cfpf_office_id)
   references cfpf_offices;
alter table cfpf_offices_docs add foreign key (doc_id) references docs;

alter table cfpf_tags add primary key (cfpf_tag_id);

alter table cfpf_tags_docs add primary key (cfpf_tag_id, doc_id);
alter table cfpf_tags_docs add foreign key (cfpf_tag_id)
   references cfpf_tags;
alter table cfpf_tags_docs add foreign key (doc_id) references docs;

alter table cfpf_urgencies add primary key (cfpf_urgency_id);

alter table cfpf_urgencies_docs add primary key (cfpf_urgency_id, doc_id);
alter table cfpf_urgencies_docs add foreign key (cfpf_urgency_id)
   references cfpf_urgencies;
alter table cfpf_urgencies_docs add foreign key (doc_id) references docs;
