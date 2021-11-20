FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8 as builder

WORKDIR /app

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# COPY requirements.txt .
# RUN /app/venv/bin/python3 -m pip install --upgrade pip && pip install -r requirements.txt

# try poetry
COPY poetry.lock pyproject.toml ./
RUN /app/venv/bin/python3 -m pip install --upgrade pip \
&& pip install poetry \
&& poetry config virtualenvs.create false \
&& poetry install --no-dev --no-interaction --no-ansi

# CMD uvicorn --host 0.0.0.0 --port 8680 app.api:app
CMD python main.py
