/*
# ------------------------------------------------------------
# Compilation:  gcc raceA.c -lpthread -o raceA
# Usage: raceA [nThread]
#
# This program tests for a possible race condition.
# Remarks:
#     - To find the number of CPU cores use programs: nproc, or lscpu
#     - pthread functions don't set errno like other POSIX functions
# ------------------------------------------------------------
*/
#define _REENTRANT

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>

#define N         16     //default number of threads
#define START     100	 //start of user assigned thread IDs
#define MAXTHREAD 100    //maximum number of threads

pthread_t  TID[MAXTHREAD]; //note: pthread_t is not always an unsigned long
	   		   //integer
// ------------------------------
// The FATAL function is due to the authors of the AWK Programming Language.

void FATAL (const char *fmt, ... )
{
    va_list  ap;
    fflush (stdout);
    va_start (ap, fmt);  vfprintf (stderr, fmt, ap);  va_end(ap);
    fflush (NULL); exit(1);
}
// ------------------------------

void *athread(void *arg)
{
  long  threadNum= (long) arg; 

  TID[threadNum - START] = pthread_self();
  printf("thread: number= %ld, ID= 0x%lx \n", threadNum, TID[threadNum-START]);
  pthread_exit(NULL);
}
// ------------------------------
int main(int argc, char *argv[])
{
  int       count, rval;
  long      idx;
  pthread_t ntid;

  // set the number of created threads
  count= (argc >= 2)?  atoi(argv[1]) : N;
  count= (count < MAXTHREAD)? count: N;

  for (idx = START; idx < START + count; idx++) {
      rval = pthread_create(&ntid, NULL, athread, (void *)idx);
      if (rval) FATAL("pthread_create: %s\n", strerror(rval));
  }

  for (idx = 0; idx < count; idx++) {
      printf ("debug: idx= %ld, TID= 0x%lx \n", idx, TID[idx]);
      rval = pthread_join(TID[idx], NULL);
      if (rval) FATAL("\n** pthread_join: %s\n", strerror(rval));
  }
} 
