MAKEFLAGS += --silent

DOCKER_REPO="movoin/devops-swoole-nginx"

all: swoole_v1 swoole_v2 swoole_v4

publish: push_v1 push_v2 push_v4

#
# image: movoin/devops-swoole-nginx:1
#
swoole_v1:
	bash build.sh "${DOCKER_REPO}" 1

test_v1:
	docker run -it --rm ${DOCKER_REPO}:1

run_v1:
	docker run -it --rm ${DOCKER_REPO}:1 bash

push_v1:
	docker push ${DOCKER_REPO}:1

#
# image: movoin/devops-swoole-nginx:2
#
swoole_v2:
	bash build.sh "${DOCKER_REPO}" 2

test_v2:
	docker run -it --rm ${DOCKER_REPO}:2

run_v2:
	docker run -it --rm ${DOCKER_REPO}:2 bash

push_v2:
	docker push ${DOCKER_REPO}:2

#
# image: movoin/devops-swoole-nginx:4
#
swoole_v4:
	bash build.sh "${DOCKER_REPO}" 4

test_v4:
	docker run -it --rm ${DOCKER_REPO}:4

run_v4:
	docker run -it --rm ${DOCKER_REPO}:4 bash

push_v4:
	docker push ${DOCKER_REPO}:4
