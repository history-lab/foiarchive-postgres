
# design
## id columns
always lead with entity - why? style guides, natural join, largely not
auto-generated

## enums
Let's give a try for classification, corpus to see how it works.

Why? Minimum space utilization, that it should play well with PostgREST. We
can always rollback if that turns out to be not the case. Planned use
cases:
* classification
* corpus

# tables
##POC tables
* docs
* countries
* persons
* topics
* volumes
* countries_docs
* persons_docs
* topic_docs


## tables to revisit later [web gui migration]
### better understand usage
* authorship
* curated_topics
* refs
* terms
* tokens
* persons_master (vs persons)

#### look to replace with view/materialized view if needed
* classification_{countries,doc,persons,topics}
* doc_counts
* top_*

## tables to ignore
* *_bak
* *_staging
* old_*
