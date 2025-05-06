from kafka import KafkaProducer
import json

producer = KafkaProducer(
    bootstrap_servers='payments-kafka:9092',
    value_serializer=lambda v: json.dumps(v).encode()
)
for i in range(100):
    evt = {'order_id': i, 'amount': 100 + i}
    producer.send('payment-events', evt)
producer.flush()
