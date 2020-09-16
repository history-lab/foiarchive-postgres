ALTER TABLE docs
  ADD COLUMN full_text tsvector
    GENERATED ALWAYS AS (to_tsvector('english',
                         coalesce(title, '') || ' ' || coalesce(body, '')))
    STORED;

CREATE INDEX docs$full_text ON docs USING GIN (full_text);
