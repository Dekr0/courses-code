#include <iostream>
#include <unistd.h>     // read, write, usleep
#include <fcntl.h>      // open and oflags
#include <sys/types.h>
#include <sys/stat.h>

/*
 * Name of the pipe to create (path, in current directory).
 * Pipe is a file but not any file, is the backing file for fifo (using mkfifo)
 * This backing file cannot be access by other program like VIM, etc.
 */

/*
 * Failed to make fifo if a pipe with same pipe (pathname) is already created
 * or the path doesn't exist.
 * mkfifo is a system (function) call
 */

/*
 * Read and write require file descriptor, an index in the open file table
 * so that they can redirect the data in the buffer to a corresponding file
 *
 * 0 in open file table -> stdin
 * 1 in open file table -> stdout
 * 2 in open file table -> stderr
 *
 * The number of bytes actually written can be different the number of we attempt
 * to write. For example, we want to write n bytes into the pipe but the pipe
 * might not have enough available capacity. For instance, we keep writing bytes
 * into the pipe but the bytes in the pipe aren't read. The pipe will eventually
 * be full.
 */

/*
 * A pipe is a fix-size circular buffer (queue). If you read data from the pipe,
 * there will be a pointer tell you where to start reading data from pipe,
 * and the pointer in the buffer will move, and you can't re-read the byte you
 * previously read. If you write data into the pipe, there will be a pointer tell
 * you where to start writing data into the pipe ...
 */

/*
 * There's an issue. Sometime the first time read in reader will read 15 bytes
 * from the pipe. This indicates that the first time read in read actually read
 * two write() from writer at once, and causes the second time read read 0 bytes
 * from the pipe. It is not synchronous.
 *
 * In order to make sure that we read the same data written from the write end (
 * one read after one write, sync), one way is to delay. Another way is to use
 * acknowledgement (TCP). Acknowledge the writer that read data from the pipe, if
 * the writer does not receive acknowledgement from the reader, then stop writing
 * data into the pipe until receive acknowledgement. Another way is to provide
 * the number of bytes written into the pipe
 */

using namespace std;

int main() {
   cout << "Writer started..." << endl << flush;

   const char * pipe_pathname = "./pipe";

   if (mkfifo(pipe_pathname, 0666) == -1) {
      cout << "Cannot make a pipe! Check the pathname." << endl << flush;
      exit(1);
   }

   cout << "Named pipe created" << endl << flush;

   int fd = open(pipe_pathname, O_WRONLY); // oflag for write-only access

   if (fd == -1) {
      cout << "Pipe open failed" << endl << flush;
      exit(1);
   }

   cout << "Named pipe opened for writing..." << endl << flush;

   char first[] = "msg1";
   char second[] = " and msg2";
	
   int bytes_written;

   // subtract one from the size if you don't want the null character to be written

   bytes_written = write(fd, first, sizeof first);
   cout << bytes_written << " bytes are written to the pipe: " << first <<  endl;

   bytes_written = write(fd, second, sizeof second);
   cout << bytes_written << " bytes are written to the pipe: " << second <<  endl;

   cout << "Finished writing bytes to the pipe..." << endl << flush;

   // close pipe from the write end, release resource from the open file table
   close(fd);

   // reclaim the backing file
   unlink(pipe_pathname);

   return 0;
}