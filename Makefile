default:	PartialSum
all:	PartialSum

%.o: %.c
	mpicc -c $^

PartialSum: PartialSum.o timer.o
	mpicc $^ -o PartialSum

run:
	mpirun -n 8 ./PartialSum

clean:
	rm -f PartialSum PartialSum.o timer.o