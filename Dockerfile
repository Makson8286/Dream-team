# Використовуємо офіційний образ Apache HTTP Server як базовий образ
FROM httpd:latest


# Замініть '/path/to/your/site' на шлях до директорії з файлами вашого сайту на вашій машині
COPY /app /usr/local/apache2/htdocs/

# Відкриваємо порт 80 для зовнішніх з'єднань до веб-сервера
EXPOSE 80
