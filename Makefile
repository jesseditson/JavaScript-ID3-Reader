# Binaries
UGLIFY = ./node_modules/.bin/uglifyjs
BROWSERIFY = ./node_modules/.bin/browserify
CLOSURE_COMPILER=./compiler.jar

.PHONY: dist dev

dist:
	$(BROWSERIFY) ./src/id3.js --standalone ID3 \
	--exclude xmlhttprequest \
	--exclude btoa \
	--exclude atob \
	--no-builtins | $(UGLIFY) -c > dist/id3-minimized.js

debug:
	$(BROWSERIFY) ./src/id3.js --standalone ID3 \
	--exclude xmlhttprequest \
	--exclude btoa \
	--exclude atob \
	--no-builtins --debug > dist/id3-minimized.js

compile:
	$(BROWSERIFY) ./src/id3.js --standalone ID3 \
	--exclude xmlhttprequest \
	--exclude btoa \
	--exclude atob \
	--no-builtins > output.js
	sed -i.bak "s/\.ID3/['ID3']/g" output.js
	java -jar $(CLOSURE_COMPILER) \
		--compilation_level ADVANCED_OPTIMIZATIONS \
		--js output.js \
	> dist/id3-minimized.min.js
	rm output.js*
