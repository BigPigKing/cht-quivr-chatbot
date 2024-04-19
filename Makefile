.PHONY: test dev-up dev-down prod-up prod-down

test:
	@echo "Execute PyTest ..."
	PyTest backend

dev-up:
	@echo "Starting development environment..."
	docker compose -f docker-compose.dev.yml up --build --detach

dev-down:
	@echo "Shutting down development environment..."
	docker compose -f docker-compose.dev.yml down

prod-up:
	@echo "Starting production environment..."
	docker compose -f docker-compose.prod.yml up --build --detach

prod-down:
	@echo "Shutting down production environment..."
	docker compose -f docker-compose.prod.yml down
