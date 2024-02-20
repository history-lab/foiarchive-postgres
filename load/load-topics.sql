\set corpus un
\set schema un_archives
\set tid topic_id
\i load-topics-corpus.sql
\set corpus nato
\set schema nato_archives
\i load-topics-corpus.sql 
\set corpus frus
\set schema declassification_frus
\set tid id
\set tdtabname topic_doc 
\set tscore topic_score 
\i load-topics-corpus.sql
\set corpus kissinger
\set schema declassification_kissinger
\i load-topics-corpus.sql
\set corpus cfpf
\set schema declassification_cables
\i load-topics-corpus.sql
\set corpus worldbank
\set schema declassification_worldbank
\i load-topics-corpus.sql
\set corpus briefing
\set schema briefing
\i load-topics-corpus.sql
\set corpus cabinet
\set schema declassification_cabinet
-- \set tid id
-- \set tdtabname topic_doc 
-- \set tscore topic_score 
\i load-topics-corpus.sql
\set corpus cpdoc
\set schema declassification_cpdoc
\i load-topics-corpus.sql
