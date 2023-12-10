create domain id_d as varchar(40);
create type corpus_t as enum('frus', 'cfpf', 'clinton', 'pdb', 'kissinger',
                             'nato', 'cia', 'un', 'worldbank');
create type classification_t as
   enum('top secret','secret','confidential', 'unclassified',
        'limited official use', 'restricted', 'unknown');
