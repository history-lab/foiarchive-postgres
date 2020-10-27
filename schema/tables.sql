create table docs (
    doc_id          id_d            not null,
    corpus          corpus_t        not null,
    classification  classification_t,
    authored        date,
    title           text            not null,  /* sourced from title */
    body            text            not null   /* sourced from raw_body */
);

create table persons (
    person_id       id_d    not null,
    full_name       text    not null,
    birth_year      integer,
    death_year      integer,
    description     text
);

create table persons_docs (
    person_id       id_d    not null,
    doc_id          id_d    not null
);

create table countries (
    country_id      id_d    not null,
    country_name    text    not null,
    deleted         boolean,
    official        boolean
);

create table countries_docs (
    country_id      id_d    not null,
    doc_id          id_d    not null
);

create table topics (
    topic_id        id_d    not null,
    title           text    not null,
    topic_name      text
);

create table topics_docs (
    topic_id        id_d,
    doc_id          id_d
);

create table volumes (
    volume_id               id_d,
    title_series            text,
    title_subseries         text,
    title_volnum            text,
    title_vol               text,
    editors                 text,
    publication_year        integer,
    publication_location    text,
    preface                 text,
    sources                 text
);

create table docs_frus (
    doc_id                id_d not null,
    chapt_title           text,
    volume_id             id_d,
    doc_source            text,
    authored_location     text,
    sent_from             text,
    sent_to               text,
    title_docview         text,
    subject               text,
    body                  text  /* source from body */
);
