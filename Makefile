IMAGE=miketallroth/senchacmd
VERSION=7.3.0
VERSIONLONG=7.3.0.19
VERSIONSHORT=7.3

build: Dockerfile
	docker build -t $(IMAGE):$(VERSION) .

test:
	docker run --rm $(IMAGE):$(VERSION) help

tag: 
	docker tag $(IMAGE):$(VERSION) $(IMAGE):$(VERSIONSHORT)
	docker tag $(IMAGE):$(VERSION) $(IMAGE):$(VERSIONLONG)
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest

push: 
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(VERSIONSHORT)
	docker push $(IMAGE):$(VERSIONLONG)
	docker push $(IMAGE):latest
