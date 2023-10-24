create or replace view declassification_cia.docs_view as
select m.id doc_id, m.title, 
    lower(d.classification) classification,
    m.pubdate authored,
    case when m.pages = '' then null::smallint
         else m.pages::smallint
    end pages, 
    'https://www.cia.gov/readingroom/docs/' || m.id || '.pdf' pdf,
    m.contenttype, m.collection, 'cia' corpus,
    m.release_decis, m.doccreation, m.docrelease, m.folder,
    case when m.sequenceno = '' then null::smallint  
         else sequenceno::smallint 
    end sequenceno,
    d.body, length(d.body) body_length 
    from declassification_cia.metadata m join 
         declassification_cia.docs d on m.id = d.id;
