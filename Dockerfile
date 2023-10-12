# Gunakan Node.js versi 14
FROM node:14

# Setel direktori kerja di dalam kontainer ke /src
WORKDIR /src

# Salin package.json dan package-lock.json ke direktori kerja
COPY package*.json ./

# Instal dependensi menggunakan npm
RUN npm install

# Unduh skrip wait-for-it.sh dari repositori
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Jadikan skrip wait-for-it.sh dapat dieksekusi
RUN chmod +x ./wait-for-it.sh

# Salin file index.js ke direktori kerja
COPY index.js ./

# Atur variabel lingkungan PORT ke 3000
ENV PORT=3000

# Luaskan port yang ditentukan
EXPOSE $PORT

# Tentukan perintah untuk menjalankan aplikasi setelah menunggu RabbitMQ untuk mulai
CMD ["sh", "-c", "./wait-for-it.sh my-rabbitmq:5672 --timeout=30 -- node index.js"]
