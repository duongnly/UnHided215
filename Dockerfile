
# 1. Use a more recent, supported base image like Bullseye
FROM python:3.10-slim-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y git


RUN git clone https://github.com/duongnly/UnHided215.git .

# 3. Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy the rest of your application code from the repository
COPY . .

EXPOSE 7860

# Your CMD is fine, no changes needed here
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]
