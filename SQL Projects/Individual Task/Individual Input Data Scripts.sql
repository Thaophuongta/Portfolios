-- this code is for creating the tables in the Music1 Database

CREATE DATABASE Music1;

-- Select the database
USE Music1;

-- create first tables Artists

CREATE TABLE Artists (
  ArtistId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  ArtistName varchar(255) NOT NULL,
  ActiveFrom date
);



-- create second Talbe Genres

CREATE TABLE Genres (
  GenreId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Genre varchar(50) NOT NULL
);

CREATE TABLE Albums (
    AlbumId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    AlbumName VARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    ArtistId INT NOT NULL,

    FOREIGN KEY (ArtistId)
    REFERENCES Artists (ArtistId),

    GenreID INT NOT NULL,

    FOREIGN KEY (GenreID)
    REFERENCES Genres (GenreId)
);

USE Music1;

-- Data to Genres

INSERT INTO Genres(Genre)

VALUES 

('Rock'),
('Jazz'),
('Country'),
('Pop'),
('Blues'),
('Hip Hop'),
('Rap'),
('Punk');

-- Data to Artists

INSERT INTO Artists (ArtistName, ActiveFrom)
VALUES 
  ('Iron Maiden','1975-12-25'),
  ('AC/DC','1973-01-11'), 
  ('Allan Holdsworth','1969-01-01'),
  ('Buddy Rich','1919-01-01'),
  ('Devin Townsend','1993-01-01'),
  ('Jim Reeves','1948-01-01'),
  ('Tom Jones','1963-01-01'),
  ('Maroon 5','1994-01-01'),
  ('The Script','2001-01-01'),
  ('Lit','1988-06-26'),
  ('Black Sabbath','1968-01-01'),
  ('Michael Learns to Rock','1988-03-15'),
  ('Carabao','1981-01-01'),
  ('Karnivool','1997-01-01'),
  ('Birds of Tokyo','2004-01-01'),
  ('Bodyjar','1990-01-01');


-- Data to Albums


Insert into Albums(AlbumName,ReleaseDate,ArtistId,GenreId)
values
('Powerglove','03/09/1984',1,1),
('Powerage','05/05/1978',2,1),
('Singing Down the Lane','01/01/1956',6,3),
('Ziltoid the Omniscient','05/01/2007',5,1),
('Casualties of Cool','05/01/2014',5,1),
('Epicloud','09/01/2012',5,1),
('Somewhere in Time','09/09/1986',1,1),
('Piece of Mind','05/05/1983',1,1),
('Killers','02/02/1981',1,1),
('No Prayer for the Dying','10/10/1990',1,1),
('No Sound Without Silence','09/09/2014',9,4),
('Big Swing Face','06/06/1967',4,2),
('Blue Night','11/11/2000',12,4),
('Eternity','10/10/2008',12,4),
('Scandinavia','06/06/2012',12,4),
('Long Lost Suitcase','10/10/2015',7,4),
('Praise & Blame','06/06/2010',7,4),
('Along Came Jones','05/05/1965',7,4),
('All Night Wrong','05/05/2002',3,2),
('The Sixteen Men of Tain','03/03/2000',3,2)
;
