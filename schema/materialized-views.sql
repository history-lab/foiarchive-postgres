drop materialized view if exists foiarchive.totals;
create materialized view foiarchive.totals as
select count(doc_id) doc_cnt, sum(pg_cnt) pg_cnt, sum(word_cnt) word_cnt 
   from foiarchive.docs;
grant select on foiarchive.totals to web_anon; 

drop materialized view if exists foiarchive.totals_decade;
create materialized view foiarchive.totals_decade as
select to_char(date_trunc('decade', authored), 'YYYY') decade, 
       count(doc_id) doc_cnt, sum(pg_cnt) pg_cnt, sum(word_cnt) word_cnt 
   from foiarchive.docs
   group by decade
   order by decade;
grant select on foiarchive.totals_decade to web_anon; 
comment on materialized view foiarchive.totals_decade is 
   'Totals docs, pages and words in the FOIArchive by decade';


drop materialized view foiarchive.corpora;
create materialized view foiarchive.corpora as
with doc_stats(corpus, begin_date, end_date, 
               doc_cnt, pg_cnt, word_cnt,
               day_cnt, mon_cnt, yr_cnt) as (
   select corpus, min(authored)::date, max(authored)::date, 
          count(doc_id), sum(pg_cnt), sum(word_cnt),
          count(distinct authored::date) day_cnt, 
          count(distinct date_trunc('month', authored)) mon_cnt, 
          count(distinct date_trunc('year', authored)) yr_cnt 
      from foiarchive.docs
      group by corpus),
topic_stats(corpus, topic_cnt) as (
   select corpus, count(topic_id) topic_cnt
      from foiarchive.topics
      group by corpus)
select ds.corpus, cm.title, begin_date, end_date, 
       doc_cnt, pg_cnt, word_cnt, topic_cnt,
       day_cnt, mon_cnt, yr_cnt,
       case when day_cnt <= 90 then 'day'       
            when mon_cnt <= 90 then 'month'
            when yr_cnt  <= 90 then 'year'
            else 'decade' 
       end as agg_date_type,
       case when day_cnt <= 90 then 'YYYY-MM-DD'
            when mon_cnt <= 90 then 'YYYY-MM'
            when yr_cnt  <= 90 then 'YYYY'
            else 'decade'
       end as agg_date_fmt
   from doc_stats ds
      join foiarchive.corpora_metadata cm on ds.corpus = cm.corpus 
      left join topic_stats ts on ds.corpus = ts.corpus;
grant select on foiarchive.corpora to web_anon;
