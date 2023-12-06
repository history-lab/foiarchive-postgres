alter table declassification_cia.docs add column char_cnt int;
update declassification_cia.docs set char_cnt = length(body);
alter table declassification_cia.docs alter column char_cnt set not null; 