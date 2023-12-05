FROM python
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY musica.py /home/myapp/
EXPOSE 7033
CMD python3 /home/myapp/musica.py
