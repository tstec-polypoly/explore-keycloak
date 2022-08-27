inf-keycloak Start
================

# Run keycloak locally

```
docker-compose build
docker-compose up
```

# Local keycloak access

https://localhost:8037/admin/master/console
u: admin
p: admin

# Using Jupyter notebook with nbdev

Setup:

```
poetry install

nbdev_install_quarto
poetry run nbdev_install_quarto
# Start a new shell and ensure `which quarto` returns a valid path.
  # Note: `poetry run nbdev_new` was run to initialize this repository.

# Initialize git hooks for Git-friendly Jupyter.
poetry run nbdev_install_hooks
```

Documentation:

https://tstec-polypoly.github.io/explore-keycloak/
