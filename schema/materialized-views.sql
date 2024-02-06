drop materialized view foiarchive.metrics
create materialized view foiarchive.metrics as
select count(doc_id) doc_cnt, sum(pg_cnt) pg_cnt, sum(word_cnt) word_cnt 
   from foiarchive.docs;
grant select on foiarchive.metrics to web_anon;   

drop materialized view foiarchive.corpora;
create materialized view foiarchive.corpora as
select corpus, min(authored)::date begin_date, max(authored)::date end_date,  
       count(doc_id) doc_cnt, sum(pg_cnt) pg_cnt, sum(word_cnt) word_cnt 
   from foiarchive.docs
   group by corpus;
grant select on foiarchive.corpora to web_anon;
