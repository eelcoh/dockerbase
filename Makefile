.DEFAULT_GOAL := mac
.PHONY: google


GOOGLE = europe-west4-docker.pkg.dev/websites-394411/webstekjes/dockerbase:$(VER)
GOKARNA = gokarna:5000/dockerbase:$(VER)

local: gokarna
remote: google
both: gokarna pull tag push


google: 
	docker build --tag $(GOOGLE) .
	docker push $(GOOGLE)

gokarna: 
	docker build --tag $(GOKARNA) .
	docker push $(GOKARNA)

pull: 
	docker pull $(GOKARNA)

tag: 
	docker image tag $(GOKARNA) $(GOOGLE)

push:
	docker push $(GOOGLE)



