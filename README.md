# Payment Processing Infra

Bu repo, Ödeme Sistemleri için Kubernetes, Kafka, CI/CD, Monitoring, Load Testing ve Backup konfigürasyonlarını içerir.

## Dizin Yapısı

- `k8s/` : Kubernetes manifest dosyaları
- `ci/` : Jenkinsfile  
- `monitoring/` : Prometheus & Grafana ayarları
- `load-testing/` : k6 senaryoları, Kafka producer/consumer örnekleri  
- `backup/` : PostgreSQL Cronjob  
- `scripts/` : Shell script’ler  
- `sql/` : Oracle SQL örneği

## Hızlı Başlangıç

3. `k6 run load-testing/load-test.js`
4. `crontab -e` → monitor script’i ekle


1. Klonlayalım:  
   ```bash
   git clone git@github.com:KULLANICI_ADIN/payment-processing-infra.git
   cd payment-processing-infra
   ```
2. Kubernetes kaynaklarını uygulayalım:  
   ```bash
   kubectl apply -f k8s/namespace.yaml
   kubectl apply -f k8s/redis.yaml
   kubectl apply -f k8s/postgres.yaml
   kubectl apply -f k8s/kafka.yaml
   ```
3. Kafka Topic Oluşturalım:  
   ```bash
   ./scripts/create_topic.sh
   ```
4. CI/CD Pipeline:  
   - Jenkins’e gidip `ci/Jenkinsfile`’ı pipeline olarak ekle.  
5. Monitoring:  
   ```bash
   helm install prometheus prometheus-community/prometheus \
     -f monitoring/prom-values.yaml -n payments-namespace
   ```
6. Load Testing:  
   ```bash
   k6 run --vus 5 --iterations 50 load-testing/load-test.js
   ```
7. Crontab ekleyelim:  
   ```bash
   crontab -e
   # içine ekleyelim:
   * * * * * /bin/bash /mnt/data/payment-processing-infra/scripts/monitor_and_restart.sh
   ```
