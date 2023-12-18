alter type foiarchive.corpus_t add value 'nato';

insert into foiarchive.docs (doc_id, corpus, classification, authored, title,
                             body, source)
select doc_id, 'nato', NULL classification, doc_date authored,
       case when title is not null then title
            else 'NATO Archives: ' || doc_id || ', ' || url
       end,
       body, pdf_url source
from nato_archives.docs;

update foiarchive.docs fd
    set (char_cnt, word_cnt, pg_cnt, doc_lang) =
        (select d.char_cnt, d.word_cnt, d.pg_cnt, d.lang 
            from nato_archives.docs d
            where d.doc_id = fd.doc_id::integer)
    where corpus = 'nato';
