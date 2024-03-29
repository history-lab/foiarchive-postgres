-- replace frus-only foiarchive tables with views on declassification_frus
-- this should be one time switch
drop table foiarchive.docs_frus;
\i docs_frus.sql
drop table foiarchive.volumes;
\i volumes.sql