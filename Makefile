CXX=clang
FOBJC_FLAGS=$(shell objfw-config --all)
CFLAGS=-fobjc-arc -g

hello: hello.m
	$(CXX) $(FOBJC_FLAGS) $(CFLAGS) $< -o $@

clean:
	rm -f hello

.PHONY: clean
