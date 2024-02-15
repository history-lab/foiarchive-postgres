insert into foiarchive.topics (corpus, topic_id, title, name)
select :'corpus', :tid, title, name
from :schema.topics;

insert into foiarchive.topic_docs(corpus, topic_id, doc_id, score)
select :'corpus', topic_id, doc_id, :tscore
from :schema.:tdtabname;
