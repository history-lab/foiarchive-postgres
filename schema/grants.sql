-- web_anon role has been created per the PostgREST docs
grant usage on schema foiarchive to web_anon;
grant select on foiarchive.docs to web_anon;
grant select on foiarchive.countries to web_anon;
grant select on foiarchive.countries_docs to web_anon;
grant select on foiarchive.persons   to web_anon;
grant select on foiarchive.persons_docs to web_anon;
grant select on foiarchive.topics to web_anon;
grant select on foiarchive.topics_docs to web_anon;
grant select on foiarchive.docs_frus to web_anon;
grant select on foiarchive.volumes to web_anon;
grant select on foiarchive.corpora to web_anon;
grant select on foiarchive.entities to web_anon;
