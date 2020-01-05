#!/usr/bin/env bash

# watch the java files and continously deploy the service
export UUID=$(uuidgen)
cargo install --path . --root ./apps --force -j 4
skaffold run -p dev
reflex -r "\.rs$" -- bash -c 'export UUID=$(uuidgen) && cargo install --path . --root ./apps --force -j 4 && skaffold run -p dev'
skaffold delete -p dev
docker image prune -af