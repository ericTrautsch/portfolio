# Portfolio

This is my portfolio website. Also a showcase of standard deployment practices (although no reason to build bespoke when common tools work well).

Currently hosted at [erictrautsch.dev](https://erictrautsch.dev) via Docker on a [Hetzner](https://www.hetzner.com/) host running Ubuntu.

When a new release is created, a new version of the docker image is built and published to the GitHub Container Registry (GHCR). Right now I've manually updated the deployed version of the container, but later on I will update with a basic CD that deploys the portfolio whenever I tag a new release.
