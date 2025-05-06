from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    'payment-events',
    bootstrap_servers='payments-kafka:9092',
    auto_offset_reset='earliest',
    value_deserializer=lambda m: json.loads(m.decode())
)
for msg in consumer:
    print("Alınan mesaj:", msg.value)
