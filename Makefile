.PHONY: install venv ipython clean test watch lint
install:
	@echo "Installing project dependencies"
	@.venv/bin/python -m pip install -e .

venv:
	@echo "Creating virtual environment"
	@.venv/bin/python -m pip -m venv .venv

ipython:
	@echo "Starting IPython"
	@.venv/bin/ipython

lint:
	@.venv/bin/flake8 --exclude=.venv,build

fmt:
	@.venv/bin/isort dundie tests integration
	@.venv/bin/black dundie tests integration

test:
	@.venv/bin/pytest -s

watch:
	#@.venv/bin/ptw
	@ls **/*.py | entr pytest

clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build
