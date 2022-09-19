FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN node . --db 'mongodb+srv://xpenta:xpenta@xpenta.abv381s.mongodb.net/?retryWrites=true&w=majority'

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
