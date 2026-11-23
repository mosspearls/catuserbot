
FROM python:3.10-slim-bullseye

# Working directory
WORKDIR /userbot

# Timezone
ENV TZ=Asia/Kolkata

## Copy files into the Docker image
COPY . .

ENV PATH="/home/userbot/bin:$PATH"

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    neofetch \
    libjpeg-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


CMD ["python3","-m","userbot"]
