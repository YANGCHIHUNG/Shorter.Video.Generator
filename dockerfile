FROM python:3.10

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \
    git ffmpeg poppler-utils libpoppler-cpp-dev pkg-config cmake \
    && pip install --no-cache-dir -r win_requirements.txt

EXPOSE 5001

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5001"]
