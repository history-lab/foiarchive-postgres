-- web_anon role has been created per the PostgREST docs
grant usage on schema foiarchive to web_anon;
GRANT SELECT ON foiarchive.classifications TO web_anon;
GRANT SELECT ON foiarchive.corpora TO web_anon;
GRANT SELECT ON foiarchive.docs TO web_anon;
GRANT SELECT ON foiarchive.docs_frus TO web_anon;
GRANT SELECT ON foiarchive.documents TO web_anon;
GRANT SELECT ON foiarchive.entities TO web_anon;
GRANT SELECT ON foiarchive.entity_docs TO web_anon;
GRANT SELECT ON foiarchive.topic_docs TO web_anon;
GRANT SELECT ON foiarchive.topics TO web_anon;
GRANT SELECT ON foiarchive.totals TO web_anon;
GRANT SELECT ON foiarchive.totals_decade TO web_anon;
