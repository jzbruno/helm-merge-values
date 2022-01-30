# Helm Merge Values

## Overview

Helm Merge Values is a plugin to combine one or more Helm values files and zero or more value overrides provided on the command line.

The main use case is to automatically create an application specific values file that can be included when using a starter chart (think many microservices using the same base chart). When the application is packaged it can run as a standalone artifact with no extra input or management of values files externally.

The main difference between this plugin and others.

* Accepts multiple yaml files
* Accepts set flags on the CLI
* Uses same parameter format as Helm
* Use Helm 3 Go library to do merging so the output will be the same created by same.

Contents:

* [Install](#install)
* [Usage](#usage)
* [Alternatives](#alternatives)

## Install

```sh
helm plugin install https://github.com/jzbruno/helm-merge-values --version 0.5.0
```

## Usage

The basic command syntax.

```sh
helm merge-values [-f/--values path ...] [--set k=v,k=v ...] [--set-file k=v,k=v ...] [--set-string k=v,k=v ...]
```

For example.

```sh
helm merge-values -f examples/values-a.yaml -f examples/values-b.yaml --set replicas=4 --set image=test:1.0.0
```

Since we are using the Helm Go library for merging values, the same priority rules apply as described in [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing).

## Alternatives

The [helm-plugin](https://github.com/topics/helm-plugin) label was used to search for plugin projects on GitHub. Each project readme was used to determine if the required functionality is supported, along with searching of the code base.

Requiements:

* Use same lib as Helm to ensure merge occurs the same way. Most use [spf13/cobra](github.com/spf13/cobra).
* Accept multiple files
* Accept multiple CLI params

| Plugin | Helm lib | Files | Set |
| --- | --- | --- | --- |
| [helm-merge-values](https://github.com/jzbruno/helm-merge-values) (this) | v3 | y | y |
| [helm-push-artifactory-plugin](https://github.com/belitre/helm-push-artifactory-plugin) | x | x | y |
| [helm-subenv](https://github.com/hydeenoble/helm-subenv) | x | x | x |
| [helm-pack](https://github.com/thynquest/helm-pack) | x | x | y |
| [helm-starter](https://github.com/jlegrone/helm-starter) | x | x | x |
| [helm-plugin-render-values](https://github.com/vivid-money/helm-plugin-render-values) | x | y | x |
| [helm-values](https://github.com/shihyuho/helm-values) | x | y | x |
| [helm-external-val](https://github.com/kuuji/helm-external-val) | x | x | x |
