# # Etap 1: Budowanie aplikacji Node.js
# FROM node:latest AS builder

# # Ustawienie katalogu roboczego
# WORKDIR /app

# # Skopiowanie plików projektu (pliku package.json oraz plików aplikacji)
# COPY package.json .
# COPY index.js .

# # Instalacja zależności
# RUN npm install

# # Etap 2: Utworzenie obrazu Nginx
# FROM nginx:latest

# # Zdefiniowanie zmiennej VERSION
# ARG VERSION=1.0.0
# ENV APP_VERSION=$VERSION

# # Skopiowanie plików aplikacji z etapu pierwszego do katalogu domyślnego Nginx
# COPY --from=builder /app /app

# # Ustawienie komendy HEALTHCHECK
# HEALTHCHECK --interval=5s --timeout=3s CMD curl -f http://localhost:8888/ || exit 1

# # Ekspozycja portu 80
# EXPOSE 80

# # Rozpoczęcie serwera Nginx
# CMD ["sh","-c","nginx & node /app/index.js"]

# Etap 1: Budowanie aplikacji Node.js
FROM node:latest AS builder

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie plików projektu (pliku package.json oraz plików aplikacji)
COPY package.json .
COPY index.js .

# Instalacja zależności
RUN npm install

# Zdefiniowanie zmiennej VERSION
ARG VERSION=1.0.0
ENV APP_VERSION=$VERSION

# Etap 2: Utworzenie obrazu Nginx
FROM nginx:latest

# Skopiowanie plików aplikacji z etapu pierwszego do katalogu domyślnego Nginx
COPY --from=builder /app /usr/share/nginx/html

# Ustawienie komendy HEALTHCHECK
HEALTHCHECK --interval=5s --timeout=3s CMD curl -f http://localhost/ || exit 1

# Ekspozycja portu 80
EXPOSE 80

# Rozpoczęcie serwera Nginx
CMD ["nginx", "-g", "daemon off;"]