@echo off 
echo.
@echo [1 of 2] Starting elasticsearch
start "" C:\WeiKha~1\Apps\ELK622\elasticsearch\bin\elasticsearch.bat
echo.
timeout /t 10
@echo [2 of 2] Starting kibana
start "" C:\WeiKha~1\Apps\ELK622\kibana\bin\kibana.bat
echo.
timeout /t -1
@echo Check if elasticsearch is started
curl "http://127.0.0.1:9200"
echo.
@echo Check cluster health
curl -XGET "http://localhost:9200/_cluster/health"
echo.

rem sample: Getting Started with Elastic Stack for Apache Logs
rem https://github.com/elastic/examples/tree/master/Common%20Data%20Formats/apache_logs

rem timeout /t -1
rem @echo Start Logstash when ready
rem cd\WeiKha~1\Apps\ELK622\logstash
rem @echo logstash -f logstash.conf
rem bin\logstash -f logstash.conf
rem echo.
rem @echo Data loaded

rem logstash -f logstash.conf --config.reload.automatic
rem elasticsearch-plugin install file:///C:\WeiKha~1\Apps\ELK622\x-pack-6.2.2.zip