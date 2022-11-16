target:
	cc sample.c -o sample

run: target
	./sample

check: run
	echo "check ok"

distcheck: run
	echo "distcheck ok"

doc:
	echo "doxygen on all files ,-)"
