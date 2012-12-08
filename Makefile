CXX=clang
FOBJC_FLAGS=$(shell objfw-config --cflags --objcflags)
GTK_CFLAGS=$(shell pkg-config --cflags gtk+-3.0)

FOBJC_LIBS=$(shell objfw-config --ldflags --libs)
GTK_LIBS=$(shell pkg-config --libs gtk+-3.0)

CFLAGS=-fobjc-arc -g

hello: hello.o MainWindow.o
	$(CXX) $(FOBJC_LIBS) $(GTK_LIBS) -o $@ $^

hello.o: hello.m
	$(CXX) $(GTK_CFLAGS) $(FOBJC_FLAGS) $(CFLAGS) -c $<

MainWindow.o: MainWindow.m MainWindow.h
	$(CXX) $(GTK_CFLAGS) $(FOBJC_FLAGS) $(CFLAGS) -c $<

clean:
	rm -f hello
	rm -f *.o

.PHONY: clean
