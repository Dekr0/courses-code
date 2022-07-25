#include "simulator.h"


Simulator::Simulator(char *filename, int monitorTime, int numIteration) {
    this->file = fopen(filename, "r");

    if (this->file == nullptr) {
        cerr << "fopen() error" << endl;
        exit(1);
    }
}


void Simulator::readFile() {
    vector<string> tokens;

    int flag = getSplitLine(this->file, tokens);

    while(flag != EOF) {
        if (flag) {
            parsedLine(tokens);
        }

        flag = getSplitLine(this->file, tokens);
    }

    void * status;

    for (auto &job : jobs) {
        if (pthread_join(job.first, &status) != 0)
            cerr << "pthread_join error()" << endl;
    }

    fclose(this->file);
}


void Simulator::parsedLine(vector<string> &tokens) {
    if (tokens.front() == "resource") {
        for (auto it = tokens.begin() + 1; it != tokens.end(); ++it) {
            if (manager.addResource(*it))
                cerr << "maximum number of resource types reaches" << endl;
        }

    } else if (tokens.front() =="job")
        createJob(tokens);
}


void Simulator::createJob(vector<string> &args) {
    JobFrame frame = Job::composeJobFrame(args);

    pthread_t jobId;

    if (pthread_create(&jobId, NULL, (ThreadFuncPtr)&Job::startJob, &frame) != 0) {
        cerr << "pthread_create() error" << endl;
    } else {
        jobs[jobId] = frame.jobName;
    }
}


JobFrame Job::composeJobFrame(vector<string> &args) {
    JobFrame frame;

    memset((char *)&frame, 0, sizeof(frame));

    auto it = args.begin() + 1;

    frame.jobName = *(it++);

    frame.busyTime = stoi(*it++);
    frame.idleTime = stoi(*it++);

    for (;it != args.end(); ++it) {
        int index = it->find(":");

        string typeName = it->substr(0, index);
        string numUnits = it->substr(index + 1);

        frame.acqResource[typeName] = stoi(numUnits);
    }

    return frame;
}