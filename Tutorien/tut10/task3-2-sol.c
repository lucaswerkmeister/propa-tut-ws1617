#include <mpi.h>

void my_int_sum_reduce(int *sendbuf, int *recvbuf,
                       int count, int root, MPI_Comm comm)
{
  int size, rank;
  MPI_Comm_size(comm, &size);
  MPI_Comm_rank(comm, &rank);
  
  if (rank == root) {
    for (int i = 0; i < count; i++)
      recvbuf[i] = sendbuf[i];
    
    for (int i = 0; i < count; i++) {
      if (i == root) continue;
      int other[count]; // C99; bad for large count
      MPI_Recv(other, count, MPI_INT, i,
               0, comm, MPI_STATUS_IGNORE);
      for (int j = 0; j < count; j++)
        recvbuf[j] += other[j];
    }
  } else {
    MPI_Send(sendbuf, count, MPI_INT, root, 0, comm);
  }
}
