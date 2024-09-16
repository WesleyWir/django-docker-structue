COMMANDS := node
ifneq (filter $(COMMANDS),$(firstword $(MAKECMDGOALS)))
COMMANDS_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(COMMANDS_ARGS):;@:)
endif

.PHONY: app
app:
	docker compose exec app $(COMMANDS_ARGS)

.PHONY: start
start:
	docker compose start

.PHONY: stop
stop:
	docker compose stop

.PHONY: restart
restart:
	docker compose restart

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down