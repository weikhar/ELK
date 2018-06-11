@echo off
echo restart ELK data
echo [1/3 ElasticSearch]
cd\WeiKha~1\Apps\ELK622\elasticsearch
echo [   removing \data]
rd data /s /q
cd logs
echo [   removing \logs]
del . /q
echo [2/3 Kibana]
cd\WeiKha~1\Apps\ELK622\kibana\data
echo [   removing \data]
del . /q
echo [3/3 Logstash]
cd\WeiKha~1\Apps\ELK622\logstash\logs
echo [   removing \logs]
del . /q
cd\WeiKha~1\Apps\ELK622\logstash
echo [   removing \data]
rd data /s /q
echo [   removing NULL]
del NULL
cd..
cd..
echo [done]