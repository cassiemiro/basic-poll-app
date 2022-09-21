MANAGE_PY=src/manage.py
DEV_SETTINGS=basic_poll.settings.development
PROD_SETTINGS=basic_poll.settings.production

help:  ## this may help
	awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

clean: ## clean local environment
	find . -name "*.pyc" | xargs rm -rf
	find . -name "*.pyo" | xargs rm -rf
	find . -name "__pycache__" -type d | xargs rm -rf
	rm -f .coverage
	rm -rf htmlcov/
	rm -rf .pytest_cache/
	rm -f coverage.xml
	rm -f *.log

pip-upgrade: ## pip upgrade
	pip install --upgrade pip

install: ## install requirements
	pip install -r requirements.txt

create-venv: ## create virtualenv with pyenv
	pyenv virtualenv basic-poll-app

delete-venv: ## delete virtualenv with pyenv
	pyenv virtualenv-delete basic-poll-app

fix-python-imports: ## fix python imports
	isort ./src

shell: ## open django shell
	python $(MANAGE_PY) shell --setings=$(DEV_SETTINGS)

docker-up: ## start docker postgres
	docker compose up

docker-down: ## stop docker postgres
	docker compose down

migrations: ## generate migrations
	python $(MANAGE_PY) makemigrations --settings=$(DEV_SETTINGS)

migrate: ## apply migrations
	python $(MANAGE_PY) migrate --settings=$(DEV_SETTINGS)

superuser: ## create django super user
	python $(MANAGE_PY) createsuperuser --settings=$(DEV_SETTINGS)

run: ## run django server
	python $(MANAGE_PY) runserver --settings=$(DEV_SETTINGS)
