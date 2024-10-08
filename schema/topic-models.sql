-- Generalized topic-model db component
create table if not exists topics (
    topic_id        integer      primary key,
    title           text         not null,
    name            text         not null
);
comment on table topics is
    'Set of topics generated by topic modeling';


create table if not exists topic_docs (
    topic_id        integer     references topics,
    doc_id          :doc_dtype  references :doc_table,
    score           float       not null,
    primary key (topic_id, doc_id)
);
comment on table topic_docs is
   'Strength of assocation between a topic and a doc';
