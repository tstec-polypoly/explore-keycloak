Explore Keycloak
================

<!-- WARNING: THIS FILE WAS AUTOGENERATED! DO NOT EDIT! -->

- [Magic Link Experiment](00_keycloak_generate_magic_link.ipynb)

## Run Keycloak locally

This also runs postgresql and mailhog containers.

    docker-compose build
    docker-compose up

## Local Keycloak access

<https://localhost:8037/admin/master/console>

- user: admin
- pass: admin

## Keycloak Configuration

![Alt text](MagicLinkAuthConfiguration/01.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/02.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/03.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/04.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/05.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/06.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/07.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/08.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/09.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/10.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/11.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/12.png?raw=true "Title") ![Alt
text](MagicLinkAuthConfiguration/13.png?raw=true "Title")

## Mailhog

Check for test mails send by Keycloak

<http://localhost:8025/>

## Using Jupyter notebook with nbdev

### Install poetry package manager

Note: Using poetry is easier than Conda.

    # From https://python-poetry.org/docs/
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

If you’ve already got poetry, you might want to…

`poetry self update`

### Install Jupyter with nbdev

From https://nbdev.fast.ai/01_Tutorials/01_tutorial.html

    # Install jupyter and nbdev in project's environment
    poetry install

    # Install nbdev dependancy quarto, see https://quarto.org/docs/get-started/hello/jupyter.html
    poetry run nbdev_install_quarto
      # Start a new shell and ensure `which quarto` returns a valid path.

    # Note: `poetry run nbdev_new` was run to initialize this repository.

    # Initialize git hooks for Git-friendly Jupyter.
    poetry run nbdev_install_hooks

### Starting Jupyter

`poetry run jupyter notebook`

### nbdev generated documentation

Update README.md with `poetry run nbdev_readme`

https://tstec-polypoly.github.io/explore-keycloak/
