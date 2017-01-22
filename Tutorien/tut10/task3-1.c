#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpi.h>

int main(int argc, char* argv[]) {
  MPI_Init(&argc, &argv);
  
  int size, rank;
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  
  int sendbuffer[4];
  int recvbuffer[4];
  
  for (int i = 0; i < 4; i++) {
    sendbuffer[i] = rank + i;
  }
  
  MPI_Reduce(sendbuffer, recvbuffer, 4, MPI_INT,
             MPI_SUM, 0, MPI_COMM_WORLD);
  
  MPI_Finalize();
  return EXIT_SUCCESS;
}
