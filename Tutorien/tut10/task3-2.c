#include <error.h>
#include <mpi.h>
#include <stdlib.h>

void my_int_sum_reduce(int *sendbuf, int *recvbuf,
                       int count, int root, MPI_Comm comm);

int main(int argc, char* argv[]) {
  int my_rank;
  const int count = 4;
  const int root = 0;
  
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
  
  int sendbuf[count];
  for (int i = 0; i < count; i++)
    sendbuf[i] = i;
  
  int recvbuf1[count], recvbuf2[count];
  my_int_sum_reduce(sendbuf, recvbuf1, count,                   root, MPI_COMM_WORLD);
  MPI_Reduce       (sendbuf, recvbuf2, count, MPI_INT, MPI_SUM, root, MPI_COMM_WORLD);
  
  if (my_rank == root)
    for (int i = 0; i < count; i++)
      if (recvbuf1[i] != recvbuf2[i])
        error(EXIT_FAILURE, 0, "buffers differ at index %d: %d != %d", i, recvbuf1[i], recvbuf2[i]);
  
  MPI_Finalize();
  return 0;
}
