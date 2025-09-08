set positional-arguments
set shell := ["bash", "-cue"]
root_dir := `git rev-parse --show-toplevel`
ctr := env("CTR", "podman")

version := env("VERSION", "latest")
image := "ghcr.io/swisscatplus/catplus-chembord:" + version
image_dir := root_dir + "/tools/image"

# Default recipe to list all recipes.
[private]
default:
  just --list image --no-aliases

# Build Docker images (for local testing)
build *args:
  cd {{root_dir}} && \
    {{ctr}} build \
      -f "{{image_dir}}/Dockerfile" \
      --build-arg VERSION={{version}} \
      -t {{image}} \
      {{args}} \
      .

# Run docker image
run *args: build
  @echo "🐋 Running docker image"
  cd {{root_dir}} && \
    {{ctr}} run \
      -it \
      --rm \
      --env-file .env \
      -p 3000:3000 \
      {{args}} \
      {{image}}
