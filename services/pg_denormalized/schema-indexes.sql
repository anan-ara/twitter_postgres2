BEGIN;
CREATE INDEX idx_extended_tag ON tweets_jsonb USING GIN ((data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX idx_text ON tweets_jsonb USING GIN(to_tsvector('english',data->>'text'));
CREATE INDEX idx_textfull ON tweets_jsonb USING GIN(to_tsvector('english',(data->'extended_tweet'->>'full_text')));
COMMIT;
