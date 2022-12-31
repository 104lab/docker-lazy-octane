#!/usr/bin/make -f
VERSION := latest
SHELL := bash

.PHONY: all shell run 8.0 8.1

# ------------------------------------------------------------------------------

all: 8.2 8.1 8.0

8.2:
	docker build --progress=plain -t=lazy-octane:8.2 8.2
	docker build --progress=plain -t=lazy-octane:8.2-alpine 8.2/alpine

8.1:
	docker build --progress=plain -t=lazy-octane:8.1 8.1
	docker build --progress=plain -t=lazy-octane:8.1-alpine 8.1/alpine

8.0:
	docker build --progress=plain -t=lazy-octane:8.0 8.0
	docker build --progress=plain -t=lazy-octane:8.0-alpine 8.0/alpine

shell:
	docker run --rm -it -v `pwd`:/source -w /source lazy-octane:$(VERSION) $(SHELL)

run:
	docker run --rm -it -v `pwd`:/source -w /source $(IMAGE):$(VERSION)
