FROM python:3.13-alpine

WORKDIR /usr/src/app

# Install dependencies
RUN apk add --no-cache git

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Install the package
RUN pip install --no-cache-dir .

ENTRYPOINT [ "attachment-downloader" ]
