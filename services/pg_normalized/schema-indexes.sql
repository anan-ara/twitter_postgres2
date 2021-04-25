BEGIN;
CREATE INDEX idx_tag_tag ON tweet_tags(tag, id_tweets);
CREATE INDEX idx_tag_id ON tweet_tags(id_tweets);
CREATE INDEX idx_tweets_id ON tweets(id_tweets);
CREATE INDEX idx_tweets_fts ON tweets USING GIN(to_tsvector('english',text));
COMMIT;
