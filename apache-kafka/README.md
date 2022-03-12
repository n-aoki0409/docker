#### kafka-cli 上での動作確認

#### topic 作成

kafka-topics --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --create --topic first-topic --partitions 3 --replication-factor 3

#### topic 確認

kafka-topics --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --describe --topic first-topic

#### producer 起動

kafka-console-producer --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --topic first-topic

#### consumer 起動

kafka-console-consumer --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --topic first-topic

#### connect 動作確認

##### FileStreamSourceConnector の設定

curl -XPOST http://localhost:8083/connectors -H 'Content-Type:application/json' -d '
{
"name": "source-zaiko-data",
"config": {
"connector.class": "org.apache.kafka.connect.file.FileStreamSourceConnector",
"file": "/home/appuser/zaiko-latest.txt",
"topic": "zaiko-data"
}
}
'

##### FileStreamSinkConnector の設定

curl -XPOST http://localhost:8083/connectors -H 'Content-Type:application/json' -d '
{
"name": "sink-zaiko-data",
"config": {
"connector.class": "org.apache.kafka.connect.file.FileStreamSinkConnector",
"file": "/home/appuser/ec-zaiko-latest.txt",
"topics": "zaiko-data"
}
}
