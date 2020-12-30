create table docs (
    doc_id          id_d            not null,
    corpus          corpus_t        not null,
    classification  classification_t,
    authored        timestamp with time zone,
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

create table docs_clinton (
    doc_id                id_d not null,
    thread_id             int  not null,
    message_num           text,
    doc_batch             text,
    author                text,
    posted_date           date,
    declass_date          date,
    reason                text,
    source_url            text,
    original_url          text);

create table cfpf_concepts (
    cfpf_concept_id      id_d not null,
    concept_name         text);

create table cfpf_concepts_docs (
    cfpf_concept_id      id_d not null,
    doc_id               id_d not null);

create table cfpf_offices (
    cfpf_office_id        id_d not null,
    office_code           text not null);

create table cfpf_offices_docs (
    cfpf_office_id        id_d not null,
    doc_id                id_d not null);

create table cfpf_tags (
    cfpf_tag_id          id_d not null,
    tag                  text,
    title                text,
    description          text,
    tag_class            text,
    category             text,
    tag_action           text);

create table cfpf_urgencies (
    cfpf_urgency_id      id_d not null,
    urgency_code         text);
