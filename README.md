SprawozdanieLab5

1. Na początku należy otworzyć folder w którym znajduje się plik Dockerfile, index.html, package.json oraz obraz w postaci pliku tar.
2. Wykonać polecenie docker build --build-arg APP_VERSION=1.2.3 -t spr5 .
3. Wykonać polecenie: docker run -d -p 8888:80 spr5.
4. Pod adresem localhost:8888 otrzymujemy wynik aplikacji.
