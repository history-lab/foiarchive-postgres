./ac.sh "docs?full_text=wfts.iraq%20rumsfeld&select=doc_id,authored,classification,title"
# add full text
./ac.sh "docs?full_text=wfts.hussein%20rumsfeld&select=doc_id,authored,classification,title,body"
# add persons
./ac.sh "docs?full_text=wfts.hussein%20rumsfeld&select=doc_id,authored,classification,title,body,persons(full_name)"
# add countries
./ac.sh "docs?full_text=wfts.hussein%20rumsfeld&select=doc_id,authored,classification,title,body,persons(full_name),countries(country_name)"
# allow search for multiple entities (already demonstrated but let's show or)
./ac.sh "docs?full_text=wfts.iraq%20or%20rumsfeld&select=doc_id,authored,classification"
# classification in secret or top secret
./ac.sh "docs?classification=in.(secret,top%20secret),full_text=wfts.iraq%20or%20rumsfeld&select=doc_id,authored,classification"
# geographic query without dates
./ac.sh "countries?country_name=eq.Belize&select=docs(doc_id,authored,classification,title)"
