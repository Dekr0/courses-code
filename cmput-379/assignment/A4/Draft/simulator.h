#ifndef SIMULATOR_H
#define SIMULATOR_H


#include <cstdio>
#include <string>
#include <unordered_map>
#include <vector>

#include "pthread.h"
#include "unistd.h"

#include "resource_manager.h"
#include "utils.h"

#define WAIT 0
#define RUN 1
#define IDLE 2
#define NJOBS 25

using namespace std;


typedef struct {
    string jobName;
    int busyTime;
    int idleTime;
    unordered_map<string, int> acqResource;
    int currentIteration = 0;
} JobFrame;


typedef void * (*ThreadFuncPtr)(void *);


class Simulator {

public:
    ResourceManager manager;

    Simulator(char *, int, int);

private:
    int numJobs;
    int numIteration;

    FILE *file;

    unordered_map<pthread_t, string> jobs;

    void readFile();
    void parsedLine(vector<string> &);
    void createJob(vector<string> &);
};


class Job {

public:
    static void * startJob(void *);

    static JobFrame composeJobFrame(vector<string> &);
};


#endif
