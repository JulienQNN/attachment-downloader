FROM python:3.13-alpine

WORKDIR /usr/src/app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

RUN apk update && apk add git

# Install the package
RUN pip install --no-cache-dir .

ENTRYPOINT [ "attachment-downloader" ]
