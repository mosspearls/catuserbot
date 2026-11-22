
FROM catub/core:bullseye

# Working directory
WORKDIR /userbot

# Timezone
ENV TZ=Asia/Kolkata

## Copy files into the Docker image
COPY . .

ENV PATH="/home/userbot/bin:$PATH"

RUN apt-get update && apt-get install -y python3.10 python3.10-dev python3-pip && ln -sf /usr/bin/python3.10 /usr/bin/python3

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


CMD ["python3","-m","userbot"]
