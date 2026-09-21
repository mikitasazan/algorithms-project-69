install:
	npm ci

test:
	npm test

lint:
	npx --no-install eslint .

.PHONY: test
