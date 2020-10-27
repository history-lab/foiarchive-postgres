#curl "http://13.59.248.54:80/${1}" | python -m json.tool
#curl "http://54.163.126.149:80/${1}" | python -m json.tool
curl "http://api.foiarchive.org/${1}" | python -m json.tool
