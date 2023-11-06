create table declassification_cia.classifications
    (code               char(1)     primary key,
     classification     text        not null,
     sensitivity_level  smallint    not null);
insert into declassification_cia.classifications 
    (classification, code, sensitivity_level) values
    ('Top Secret', 'T', 1),
    ('Secret', 'S', 2),
    ('Confidential', 'C', 3),
    ('Restricted', 'R', 4),
    ('Unknown', 'F', 5),
    ('Unknown', 'K', 5),
    ('Unclassified', 'U', 6);

# TODO add FK constraint