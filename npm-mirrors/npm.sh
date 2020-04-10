#!/bin/bash

# A npm wrapper for npm to use the local registry

npm --registry http://${NPM_IP:-127.0.0.1}:${NPM_PORT:-4873} $*

