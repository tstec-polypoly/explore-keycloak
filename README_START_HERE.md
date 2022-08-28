Explore Keycloak Starter
================

# Run Keycloak locally

```
docker-compose build
docker-compose up
```

# Local Keycloak access

https://localhost:8037/admin/master/console
u: admin
p: admin

# Mailhog

Check for test mails send by Keycloak
http://localhost:8025/

# Using Jupyter notebook with nbdev

## Install poetry package manager

```
# From https://python-poetry.org/docs/
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```

## Install Jupyter with nbdev

From https://nbdev.fast.ai/01_Tutorials/01_tutorial.html

```
# Install jupyter and nbdev in project's environment
poetry install

# Install nbdev dependancy quarto, see https://quarto.org/docs/get-started/hello/jupyter.html
poetry run nbdev_install_quarto
  # Start a new shell and ensure `which quarto` returns a valid path.

# Note: `poetry run nbdev_new` was run to initialize this repository.

# Initialize git hooks for Git-friendly Jupyter.
poetry run nbdev_install_hooks
```

## Documentation

https://tstec-polypoly.github.io/explore-keycloak/
