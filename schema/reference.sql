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

create table foiarchive.corpora
    (corpus varchar(10) primary key);
insert into foiarchive.corpora(corpus)
    select distinct corpus
        from foiarchive.docs;