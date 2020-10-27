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
