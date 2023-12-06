alter table declassification_cia.docs add column word_cnt int;
update declassification_cia.docs d
    set word_cnt = (select count(*)
                       from ts_parse('default', d.body) t
                       where t.tokid = 1); 
alter table declassification_cia.docs alter column word_cnt set not null;