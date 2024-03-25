create table foiarchive.classifications
    (classification     text        primary key,
     sensitivity_level  smallint    not null);
insert into foiarchive.classifications 
    (classification, sensitivity_level) values
    ('top secret', 1),
    ('secret', 2),
    ('confidential', 3),
    ('limited official use', 4),
    ('unclassified', 5),
    ('restricted', 3),
    ('unknown', 6);

create table foiarchive.corpora_metadata
    (corpus corpus_t primary key,
     title  text);
insert into foiarchive.corpora_metadata(corpus)
    select distinct corpus
        from foiarchive.docs;
update foiarchive.corpora_metadata 
    set title = 'Foreign Relations of the United States' 
    where corpus = 'frus';
update foiarchive.corpora_metadata 
    set title = 'CIA CREST Collection' 
    where corpus = 'cia';
update foiarchive.corpora_metadata 
    set title = 'Clinton E-Mail' 
    where corpus = 'clinton';
update foiarchive.corpora_metadata 
    set title = 'Presidential Daily Briefings' 
    where corpus = 'briefing';
update foiarchive.corpora_metadata
    set title = 'State Department Central Foreign Policy Files' 
    where corpus = 'cfpf';
update foiarchive.corpora_metadata 
    set title = 'Kissinger Telephone Conversations'
    where corpus = 'kissinger';
update foiarchive.corpora_metadata 
    set title = 'NATO Archives' 
    where corpus = 'nato';
update foiarchive.corpora_metadata 
    set title = 'United Nations Archives' 
    where corpus = 'un';
update foiarchive.corpora_metadata 
    set title = 'World Bank McNamara Records' 
    where corpus = 'worldbank';
update foiarchive.corpora_metadata
    set title = 'UK Cabinet Papers' 
    where corpus = 'cabinet';
update foiarchive.corpora_metadata 
    set title = 'Azeredo da Silveira Papers' 
    where corpus = 'cpdoc';
alter table foiarchive.corpora_metadata 
    alter column title set not null;
