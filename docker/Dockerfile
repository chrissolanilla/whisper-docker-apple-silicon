# compatible with apple silicon
FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsndfile1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install Rust for required for tiktoken dependency
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

# Set working directory
WORKDIR /app

COPY . .

#install pip commands
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "-m", "whisper"]

