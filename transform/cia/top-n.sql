\set col_name pages
\set n 20
select doc_id, title, collection, contenttype, pdf, char_cnt, word_cnt, /* page_cnt */ pages
   from declassification_cia.docs_view
   where :col_name is not null
   order by :col_name desc
   limit :n;
