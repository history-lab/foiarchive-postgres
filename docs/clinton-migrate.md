# What tables do we need to take?
* classifications
* classreason_doc
* classreasons
* countries
* country_doc
* docs
* person_doc
* persons
empty:
* tokens
* topic_doc
* topic_token
* topics

## What do we have to normalize with FRUS?
* classifications
* countries
* persons

# What aggregations should we be aware?
* classification_{countries, doc, persons}
* classreason_{doc}
* doc_counts?
* top_classifications
* top_countries
* top_persons
* top_topics

# Leaving behind
* person_doc_bak2
* tokens_new
* topic_token_new
* topics_new
