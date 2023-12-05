#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp musica.py tempdir/
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile

echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY musica.py /home/myapp/" >> tempdir/Dockerfile

echo "EXPOSE 7033" >> tempdir/Dockerfile

echo "CMD python3 /home/myapp/musica.py" >> tempdir/Dockerfile

cd tempdir

docker build -t musica .

docker run -t -d -p 7033:7033 --name musicarunning musica

docker ps -a