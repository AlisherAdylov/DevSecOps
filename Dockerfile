FROM python:3-alpine

ENV user admin
ENV password pass
ENV email admin@admin.ru

WORKDIR /code

RUN mkdir db
COPY ./src /code/src
RUN pip install -r /code/src/requirements.txt

COPY . /code

EXPOSE 8000
VOLUME ["/code/db"]

CMD sh init.sh && python manage.py runserver 0.0.0.0:8000

