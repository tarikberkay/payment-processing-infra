import { Kafka } from 'k6/x/kafka';

const producer = new Kafka().producer({
  brokers: ['payments-kafka:9092']
});

export default () => {
  for (let i = 0; i < 2000; i++) {
    producer.produce({
      topic: 'payment-events',
      value: JSON.stringify({ order_id: __ITER, amount: 100 })
    });
  }
};
