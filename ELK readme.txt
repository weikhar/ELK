ELK Stack
(Elastic Logstash Kibana)

Pre-amble - on Windows 10
Based on the following version:
1) elasticsearch-6.2.2.zip
2) logstash-6.2.2.zip
3) kibana-6.2.2-windows-x86_64.zip
4) filebeat-6.2.2-windows-x86_64.zip
5) >> install the stack into a folder "ELK622"
   a) "elk622.bat" starts ELK stack without logstash
   b) "rsELK.bat" resets ELK to 'new' state

1) start the following (use "elk622.bat"):
	a) Elastic
	b) Kibana
2) ingest data
	a) if no need transform/manipulate data, feed data direct to ES using eg filebeat
	b) if need transform/manipulate data, start logstash to ingest data to Elastic
		at logstash home directory (where it was installed), run "\bin\logstash" - it allows external config file for testing/QA purposes
		eg refer to "logstash.conf" for examples
3) Load up kibana interface
	a) Open browser to "localhost:5601"
		If ELK is setup correctly, Kibana will show
		i) go to Console at "Dev Tools" & enter (for example)
		ii) to check cluster health --> Get _cluster/health
		iii) to check loaded indices --> GET _cat/indices
		iv) to delete indices --> DELETE logstash-*
	b) go to "Management > Index Pattern" and refresh/check for new data
		a) when new data is available, assign an indice name for it > click next
		b) select drop down for relevant @time.. then click next & your data is loaded
	c) Go to Discover
	d) Go to Visualize
4) Start filebeat
	Assumes [filebeat.yml] is configured to match ELK paths
	a) goto filebeat folder [..\Apps\filebeat]
	b) start Powershell
	c) run [powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1]
	d) test filebeat config [.\filebeat.exe -e test config]
	e) test filebeat output [.\filebeat.exe -e test output]
	f) start filebeat [.\filebeat.exe -c filebeat.yml -e -d "*"]
	
5) House-keeping (use "rsELK.bat)
	a) To remove old data and start over:
		i) in kibana 
			[1] > Dev Tools > run "DELETE logstash-*" to remove the indice
			[2] > Management > delete the indice
		ii) stop and close  background jobs
			[1] kibana
			[2] elasticsearch
			[3] logstash
		iii) physically remove files
			[1] go to elasticsearch folder and remove [\data], \logs\[*.*]
			[2] go to kibana folder and remove \data[*.*]
			[3] go to logstash folder and remove [\data], \logs\[*.*], the "NULL" file
		
