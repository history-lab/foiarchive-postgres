create domain id_d as varchar(40);
create type corpus_t as enum('frus', 'cables', 'cia', 'clinton', 'pdb');
create type classification_t as
   enum('top secret','secret','confidential', 'unclassified');
