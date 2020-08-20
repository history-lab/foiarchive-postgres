create schema foiarchive;

create table collections (
    code            text    primary key.
    fullname        text    not null,
    description     text    not null
);
insert into collections values (
    ('frus', 'The Foreign Relations of the United States',
     'A collection of the most important government documents in American \
      foreign relations curated by the U.S. State Department''s Office of the \
      Historian, and released in volumes that focus on specific themes or \
      geographic regions.')
)

create table docs (
    doc_id          text    primary key,
    collection      text    not null references collections,
    subject         text    not null,  /* sourced from title */
    authored        date    not null,
    classification  text,
    body            text    not null,  /* sourced from raw_body */
);
create index docs$authored on docs(authored);

create table persons (
    person_id       text    primary key,
    full_name       text    not null,
    birth_year      integer,
    death_year      integer,
    description     text
);

create table persons_docs (
    person_id       text references persons,
    doc_id          text references docs,
    constraint      primary key (person_id, doc_id)
);
create index persons_docs$doc_id on persons_docs(doc_id);

create table countries (
    country_id      text primary key,
    country_name    text not null,
    deleted         boolean
    official        boolean
);

create table countries_docs (
    country_id      text references countries,
    doc_id          text references docs,
    constraint      primary key (country_id, doc_id)
);
create index countries_docs$doc_id on countries_docs(doc_id);

create table topics (
    topic_id        text primary key,
    title           text not null,
    topic_name      text not null
);

create table topics_docs (
    topic_id        text references topics
    doc_id          text references docs
    constraint      primary key (topic_id, doc_id)
);

create table docs_frus (
    doc_id                text    primary key references docs,
    chapt_title           text,
    volume                text    references volumes_frus,
    doc_source            text,
    authored_location     text,
    sent_from             text,
    sent_to               text,
    title_docview         text,
    ssubject              text,
    raw_body              text
);

create table volumes (
    volume_id               text  primary key,
    title_series            text,
    title_subseries         text,
    title_volunum           text,
    title_vol               text,
    editors                 text,
    publication_date        date,
    publication_location    text,
    preface                 text,
    sources                 text
);

-- docs_frus table
--   chapt_title, volume, doc_source, location, sent_from, sent_to, title_docview, subject?, raw_body,
--
