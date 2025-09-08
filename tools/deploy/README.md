# CatPlus ChemBord Kubernetes Deployment

This directory contains Kubernetes manifests for deploying catplus-chembord using [ytt](https://carvel.dev/ytt/).

## Quick Start

```bash
# Render manifests
just manifests render

# Deploy to Kubernetes
just manifests deploy

# Dry run
just manifests render | kubectl apply --dry-run=client -f-
```

## Structure

```
├── templates/      # YTT templates
│   └── lib/        # Shared libraries
├── schema.yaml     # Schema definition
└── values.yaml     # Default values
```

## Configuration

Define `values.yaml` for your deployment, for example:

```yaml
#@ load("@ytt:data", "data")

#@data/values
---
name: catplus-chembord
version: latest
namespace: chembord

image:
  repository: ghcr.io/swisscatplus/catplus-chembord
  tag: latest
  pullPolicy: Always

s3:
  region: us-east-1
  endpoint: https://s3.custom-endpoint.example.com
  bucketName: catplus-chembord-bucket
  accessKeyId: ''
  secretAccessKey: ''

service:
  port: 80

ingress:
  enabled: false
```

Then use ytt to render the manifests:

```bash
just manifests render -f values.yaml
```
