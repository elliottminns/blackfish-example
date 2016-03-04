
make:
		swift build -Xlinker -L/usr/local/lib

clean:
		swift build --clean=dist
