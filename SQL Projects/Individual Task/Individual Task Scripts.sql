-- Task 1: retrieve all album released between 1982 and 1988
USE Music1;

SELECT Artists.ArtistName AS [Artist Name], Albums.AlbumName AS [Album Name], Albums.ReleaseDate AS [Release Date]
FROM Artists 
JOIN Albums
ON Artists.ArtistId = Albums.ArtistId
WHERE YEAR(ActiveFrom) BETWEEN '1982' AND '1988'

-- Task 2: How many albums were released in the summer month
SELECT COUNT(*) AS [Number of Albums Released] FROM Albums
WHERE MONTH(ReleaseDate) BETWEEN '5' AND '8'

-- Task 3: Generate a report with a new column for year of released, and filtered '2002'
SELECT Albums.AlbumName, 2023-year(Albums.ReleaseDate) AS [Years_Released]
FROM Albums

SELECT Albums.AlbumName, year(Albums.ReleaseDate) AS [Year_Released]
FROM Albums
WHERE YEAR(ReleaseDate)='2002'

-- Task 4: How many Artists begin with the letter ‘b’ or end with the ‘s’
SELECT COUNT(*) AS [Number of Artists] FROM Artists
WHERE ArtistName LIKE 'B%'OR ArtistName LIKE '%0'

-- Task 5: Update the album ‘Killers’ with ‘The Killers’
UPDATE Albums
SET AlbumName = 'The Killers'
WHERE AlbumName = 'Killers'

-- Task 6: Derive a list of artists with albums that came out in the winter
SELECT Artists.ArtistName AS [Artist Name], Albums.AlbumName AS [Album Name], Albums.ReleaseDate AS [Release Date]
FROM Artists JOIN Albums
ON Artists.ArtistId = Albums.ArtistId
WHERE MONTH(ReleaseDate) >=11 or MONTH(ReleaseDate) <=2

-- Task 7: Derive a list of albums that are Jazz or Rock
SELECT Albums.AlbumName AS [Album Name], Genres.Genre
FROM Albums 
JOIN Genres
ON Albums.GenreID = Genres.GenreId
WHERE Genres.Genre IN ('Jazz','Rock')

-- Task 8: Retrieve information about about artists, their albums, and the genres of those albums. Joined 3 tables
SELECT Artists.ArtistName AS [Artist Name], Albums.AlbumName AS [Album Name], Genres.Genre, Albums.ReleaseDate as [Release Date]
FROM Albums
JOIN Artists
ON Albums.ArtistId = Artists.ArtistId
JOIN Genres
ON Albums.GenreId = Genres.GenreId
WHERE YEAR(ReleaseDate) BETWEEN '1982' AND '1988'

--Task 9: Derive a list of artists that have released pop albums. Joined 3 tables
SELECT Artists.ArtistName AS [Artist Name], Albums.AlbumName AS [Album Name], Genres.Genre
FROM Albums
JOIN Artists
ON Albums.ArtistId = Artists.ArtistId
JOIN Genres
ON Albums.GenreId = Genres.GenreId
WHERE Genres.Genre = 'Pop'

-- Task 10: Find Genres that have no albums in the database, along with the count of such genres.
SELECT 
    Genres.Genre AS Genre,
    COUNT(Albums.AlbumId) AS AlbumCount
FROM 
    Genres
LEFT JOIN 
    Albums ON Genres.GenreId = Albums.GenreID
GROUP BY 
    Genres.Genre
HAVING 
    COUNT(Albums.AlbumId) = 0;