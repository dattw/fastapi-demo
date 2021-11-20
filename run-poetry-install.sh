python -m venv venv
export PATH=/usr/src/app/venv/bin:$PATH
python3 -m pip install --upgrade pip \
&& pip install poetry \
&& poetry config virtualenvs.create false \
&& poetry install --no-dev --no-interaction --no-ansi
