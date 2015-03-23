CREATE TABLE users (
  id    INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id      INTEGER PRIMARY KEY,
  title   VARCHAR(255) NOT NULL,
  body    TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_followers (
  id          INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id     INTEGER NOT NULL,
  FOREIGN KEY (user_id)     REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id          INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id     INTEGER NOT NULL,
  body        TEXT    NOT NULL,
  parent_id   INTEGER,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id)     REFERENCES users(id),
  FOREIGN KEY (parent_id)   REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id          INTEGER PRIMARY KEY,
  user_id     INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id)     REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  (('mathematics'), ('physics')),
  (('paul'), ('alvarez')),
  (('jasmine'), ('noack'));

INSERT INTO
  questions (title, body, user_id)
VALUES
  (('LOREM'), ('IPSUM'), 1),
  (('yo'), ('sup'), 1),
  (('title'), ('body'), 2),
  (('hello'), ('hello'), 3);

INSERT INTO
  question_followers (question_id, user_id)
VALUES
  (1, 2),
  (2, 1),
  (1, 3);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL, 2, 'hey'),
  (1, 1,    3, 'hello'),
  (2, NULL, 1, 'wassup');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 3),
  (2, 2),
  (1, 1);
