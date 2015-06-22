# Binaries
UGLIFY = ./node_modules/.bin/uglifyjs
BROWSERIFY = ./node_modules/.bin/browserify

.PHONY: dist dev

dist:
	$(BROWSERIFY) ./src/id3.js --standalone ID3 \
	--exclude xmlhttprequest \
	--exclude btoa \
	--exclude atob \
	--no-builtins | $(UGLIFY) -c > dist/id3-minimized.js

dev:
	$(BROWSERIFY) ./src/id3.js --standalone ID3 \
	--exclude xmlhttprequest \
	--exclude btoa \
	--exclude atob \
	--no-builtins --debug > dist/id3-minimized.js
