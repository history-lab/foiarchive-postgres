drop materialized view foiarchive.corpora;
create materialized view foiarchive.corpora as
select corpus, count(doc_id) doc_cnt
   from foiarchive.docs
   group by corpus;
