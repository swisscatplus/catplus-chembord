# Catplus Chembord

## Technology

The catplus chembord uses the following technologies:

- [Sveltekit](https://svelte.dev/) as Frontend Framework
- [pnpm](https://pnpm.io/) for node setup
- [Skeleton UI](https://www.skeleton.dev/) for the styles

## Quickstart

The easy way to run the project is to use docker.

First, define your .env file by copying the example:

```bash
cp .env.example .env
```

Edit .env

## Development Environment

### Pre-requisites

The development setup requires the following:
* nix
* just

Additionally, we recommend using direnv to automatically activate the development environment when entering the project directory.

### Setup

### Usage

Then use just to install, build and run the project:

```bash
just install
just build
just local
```

`just local` serves the chembord at `http://localhost:5173/chembord`

### Docker

The docker image can be built using `just image` subcommands:

```bash
just image build
just image push # this also builds the image
```

### Kubernetes

Manifests are defined in `tools/deploy`. The templates can be rendered with default values using:

```bash
just manifests render
```

And deployed with

```bash
just manifests deploy
```

## Improvements

- CHEMBORD UI Evaluation: laege-scale user testing
- Introduction RO-Crate packaging option
- Link to the downloadable campaign report
- User data contribution forms
- SPARQL documentation
