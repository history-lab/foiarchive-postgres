drop view if exists foiarchive.volumes;
create or replace view foiarchive.volumes as 
    select id::id_d volume_id, title_series, title_subseries, 
           title_volnum, title_vol, editors, 
           substr(date, 1, 4)::integer as publication_year, 
           location as publication_location, preface, sources  
    from declassification_frus.volumes;
grant select on foiarchive.volumes to web_anon;