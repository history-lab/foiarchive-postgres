--
-- absolutely critical step
set maintenance_work_mem to '1 GB';
create index on foiarchive.docs(authored);
create index on foiarchive.docs(corpus);
create index on foiarchive.docs using gin (full_text);
create index on foiarchive.docs(classification)
    where classification in ('top secret', 'secret', 'confidential', 'restricted');
-- recreate the foreign key constraints (at some point in the future)
-- refresh the materialized views
REFRESH MATERIALIZED VIEW foiarchive.totals;
REFRESH MATERIALIZED VIEW foiarchive.totals_decade;
REFRESH MATERIALIZED VIEW foiarchive.corpora;
REFRESH MATERIALIZED VIEW cnts_by_date;