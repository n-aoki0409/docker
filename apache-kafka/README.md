### topic 生成、producer、consumer 起動

#### kafka-cli 上で操作

#### topic 作成

kafka-topics --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --create --topic first-topic --partitions 3 --replication-factor 3

#### topic 確認

kafka-topics --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --describe --topic first-topic

#### producer 起動

kafka-console-producer --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --topic first-topic

#### consumer 起動

kafka-console-consumer --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --topic first-topic --from-beginning

#### schema が Avro の場合

schema-registry にログイン

kafka-avro-console-consumer --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --topic source-jdbc-test --from-beginning

### connect 動作確認

#### FileStreamSourceConnector の設定

curl -XPOST http://localhost:28082/connectors -H 'Content-Type:application/json' -d '
{
"name": "source-zaiko-data",
"config": {
"connector.class": "org.apache.kafka.connect.file.FileStreamSourceConnector",
"file": "/home/appuser/zaiko-latest.txt",
"topic": "zaiko-data"
}
}'

#### FileStreamSinkConnector の設定

curl -XPOST http://localhost:28082/connectors -H 'Content-Type:application/json' -d '
{
"name": "sink-zaiko-data",
"config": {
"connector.class": "org.apache.kafka.connect.file.FileStreamSinkConnector",
"file": "/home/appuser/ec-zaiko-latest.txt",
"topics": "zaiko-data"
}
}'

#### JdbcSourceConnector の設定

curl -XPOST http://localhost:28082/connectors -H 'Content-Type:application/json' -d '
{
"name": "source-ec-sales",
"config": {
"connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
"connection.url": "jdbc:mysql://mysql:3306/ec_sales",
"connection.user": "ec_user",
"connection.password": "ec_pass",
"mode": "incrementing",
"incrementing.column.name": "id",
"table.whitelist": "ec_sales",
"topic.prefix": "source-",
"poll.interval.ms": 1000,
"tasks.max": 1
}
}'

curl -XPOST http://localhost:28082/connectors -H 'Content-Type:application/json' -d '
{
"name": "source-pos-sales",
"config": {
"connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
"connection.url": "jdbc:mysql://mysql:3306/pos_sales",
"connection.user": "pos_user",
"connection.password": "pos_pass",
"mode": "incrementing",
"incrementing.column.name": "id",
"table.whitelist": "pos_sales",
"topic.prefix": "source-",
"poll.interval.ms": 1000,
"tasks.max": 1
}
}'

#### S3SinkConnector の設定

curl -XPOST http://localhost:28082/connectors -H 'Content-Type:application/json' -d '
{
"name": "sink-sales-data",
"config": {
"connector.class": "io.confluent.connect.s3.S3SinkConnector",
"s3.bucket.name": "datahub-sales",
"store.url": "http://s3:9000",
"storage.class": "io.confluent.connect.s3.storage.S3Storage",
"format.class": "io.confluent.connect.s3.format.json.JsonFormat",
"flush.size": 3,
"topics": "source-pos_sales,source-ec_sales",
"tasks.max": 1
}
}'

##### connector の再起動の例

curl -XPOST localhost:28082/connectors/source-ec-sales/restart?includeTasks=true

#### mqtt でメッセージ送信

eclipse-mosquitto にログイン

mosquitto_pub -h mqtt-broker -t mqtt -m "Hello MQTT!"

#### IoT データの Enrichment

###### topic の生成

kafka-topics --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --create --topic device-master --partitions 3 --replication-factor 3 --config cleanup.policy=compact
kafka-topics --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --create --topic mqtt-source --partitions 3 --replication-factor 3
kafka-topics --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --create --topic mqtt-enriched --partitions 3 --replication-factor 3

###### master データの登録

kafka-console-producer --bootstrap-server broker1:29092,broker2:29092,broker3:29092 --topic device-master --property "parse.key=true" --property "key.separator=:"
d001:XA-01,A,20180807,-
d002:XA-02,B,20180807,-
d003:XB-05,N,20180910,-

###### mqtt 用の connect を設定

curl -XPOST http://localhost:28082/connectors -H 'Content-Type:application/json' -d '
{
"name": "source-mqtt",
"config": {
"connector.class": "io.confluent.connect.mqtt.MqttSourceConnector",
"mqtt.server.uri": "tcp://mqtt-broker:1883",
"mqtt.topics": "mqtt",
"kafka.topic": "mqtt-source",
"confluent.topic.bootstrap.servers" : "broker1:29092,broker2:29092,broker3:29092",
"confluent.topic.replication.factor" : "3",
"tasks.max": "1"
}
}'

###### センサーデータの登録

mosquitto_pub -h mqtt-broker -t mqtt -m "d001,1534396810,30.5,1200"
mosquitto_pub -h mqtt-broker -t mqtt -m "d002,1534396811,31.5,1201"
mosquitto_pub -h mqtt-broker -t mqtt -m "d003,1534396812,32.5,1202"
