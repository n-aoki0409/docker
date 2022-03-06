#### kafka-cli 上での動作確認

#### topic 作成

kafka-topics --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --create --topic first-topic --partitions 3 --replication-factor 3

#### topic 確認

kafka-topics --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --describe --topic first-topic

#### producer 起動

kafka-console-producer --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --topic first-test

#### consumer 起動

kafka-console-consumer --bootstrap-server broker1:29092,broker2:39092,broker3:49092 --topic first-test
