\set cnt_col pages
\set group_by collection
select :group_by, count(*), sum(:cnt_col), avg(:cnt_col), stddev(:cnt_col),
                         min(:cnt_col), max(:cnt_col)
    from declassification_cia.docs_view
    group by :group_by
    order by sum(:cnt_col) desc;