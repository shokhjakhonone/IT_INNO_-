# Используем официальный образ Python в качестве базового
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл зависимостей в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект в контейнер
COPY . .

# Создаём пользователя для повышения безопасности
RUN adduser --disabled-password --no-create-home appuser

# Меняем владельца файлов на созданного пользователя
RUN chown -R appuser:appuser /app

# Переключаемся на созданного пользователя
USER appuser

# Указываем команду по умолчанию для запуска приложения
CMD ["python", "app.py"]