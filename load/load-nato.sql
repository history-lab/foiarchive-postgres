alter type foiarchive.corpus_t add value 'nato';

insert into foiarchive.docs (doc_id, corpus, classification, authored, title,
                             body, source)
select doc_id, 'nato', NULL classification, doc_date authored,
       case when title is not null then title
            else 'NATO Archives: ' || doc_id || ', ' || url
       end,
       body, pdf_url source
from nato_archives.docs;
