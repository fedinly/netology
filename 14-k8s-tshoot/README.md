# Решение домашнего задания к занятию Troubleshooting
## Задача
- Первая ошибка свзана с устареванием пакета radial/busyboxplus [ссылка](https://github.com/ray-project/ray/pull/63019), в файле task.yaml произведено изменение в секции Deployment;
- Вторая ошибка `unknown host auth-db` была получена при запросе лога работы пода в приложении web-consumer, связана с тем, что разрешение коротких имен в разных namespace-ах не предусмотрено, необходимо
  использовать FQDN, прописана запись `while true; do curl auth-db.data.svc.cluster.local sleep 5; done` для запуска приложения.
