# basic-poll-app
Django first app tutorial

## Installation guide
Considering you have ``pyenv`` installed with pyenv-virtualenv...

### To install python 3.8.3 or higher...
1. ``pyenv`` install 3.8.3 (python version can be > 3.8.3)
### To upgrade pip and install requirements from requirements.txt
2. ``make`` pip-upgrade
3. ``make`` install
### To create virtualenv and activate
4. ``make`` create-venv
5. ``pyenv`` activate basic-poll-app

## Running guide
Considering you have ``docker`` and ``docker compose`` installed...

### To running database, dependencies and django server...
1. ``make`` docker-up
2. ``make`` migrate
3. ``make`` run
