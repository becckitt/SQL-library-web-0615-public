CREATE TABLE series (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  author_id INTEGER,
  subgenre_id INTEGER,
  FOREIGN KEY(author_id) REFERENCES authors(id),
  FOREIGN KEY(subgenre_id) REFERENCES subgenres(id)
);

CREATE TABLE subgenres (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  name TEXT
);

CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  name TEXT
);

CREATE TABLE books (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  title TEXT,
  year INTEGER,
  series_id INTEGER,
  FOREIGN KEY(series_id) REFERENCES series(id)
);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  species TEXT,
  motto TEXT,
  series_id INTEGER REFERENCES series(id),
  author_id INTEGER REFERENCES authors(id)
);

CREATE TABLE character_books (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER REFERENCES books(id),
  character_id INTEGER REFERENCES characters(id)
);