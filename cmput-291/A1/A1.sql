CREATE TABLE Users (
    [uid] CHAR(8),
    [cdate] DATE,
    [desc] CHAR(128),
    [location] CHAR(64),
    [name] CHAR(32),
    PRIMARY KEY ([uid])
)

CREATE TABLE Badges (
    [class] CHAR(16),
    [name] CHAR(32),
    PRIMARY KEY ([class])
)

CREATE TABLE UBages (
    [bdate] DATE,
    [class] CHAR(16) NOT NULL,
    [uid] CHAR(8) NOT NULL,
    PRIMARY KEY ([bdate], [uid]),
    FOREIGN KEY ([class]) REFERENCES Badges ON DELETE NO ACTION,
    FOREIGN KEY ([uid]) REFERENCES Users ON DELETE CASCADE
)

CREATE TABLE Posts (
    [pid] CHAR(8),
    [uid] CHAR(8) NOT NULL,
    [body] CHAR(256),
    [title] CHAR(32),
    [pdate] DATE,
    PRIMARY KEY ([pid]),
    FOREIGN KEY ([uid]) REFERENCES Users ON DELETE NO ACTION
)

CREATE TABLE comment (
    [pid] CHAR(8),
    [uid] CHAR(8),
    [ctetxt] CHAR(256),
    [cdate] DATE,
    PRIMARY KEY ([pid], [uid]),
    FOREIGN KEY ([pid]) REFERENCES Posts,
    FOREIGN KEY ([uid]) REFERENCES Users
)

CREATE TABLE votes (
    [vno] CHAR(8),
    [vtype] CHAR(16),
    [vdate] DATE,
    [pid] CHAR(8),
    [uid] CHAR(8),
    PRIMARY KEY ([vno], [pid]),
    FOREIGN KEY ([pid]) REFERENCES Posts ON DELETE CASCADE,
    FOREIGN KEY ([uid]) REFERENCES Users
)

CREATE TABLE Questions (
    [pid] CHAR(8) NOT NULL,
    Answers.pid CHAR(8),
    PRIMARY KEY ([pid]),
    FOREIGN KEY ([pid]) REFERENCES Posts ON DELETE CASCADE,
    FOREIGN KEY (Answers.pid) REFERENCES Answers
)

CREATE TABLE Answers (
    [pid] CHAR(8) NOT NULL,
    Question.pid CHAR(8) NOT NULL,
    PRIMARY KEY ([pid]),
    FOREIGN KEY ([pid]) REFERENCES Posts ON DELETE CASCADE,
    FOREIGN KEY (Question.pid) REFERENCES Question ON DELETE NO ACTION
)