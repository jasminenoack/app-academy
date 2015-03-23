# == Schema Information
#
# Table name: albums
#
#  asin        :string       not null, primary key
#  title       :string
#  artist      :string
#  price       :float
#  rdate       :date
#  label       :string
#  rank        :integer
#
# Table name: styles
#
# album        :string       not null
# style        :string       not null
#
# Table name: tracks
# album        :string       not null
# disk         :integer      not null
# posn         :integer      not null
# song         :string

require_relative './sqlzoo.rb'

def alison_artist
  # Select the name of the artist who recorded the song 'Alison'.
  execute(<<-SQL)
  SELECT
    a.artist
  FROM
    albums a INNER JOIN tracks t
    ON a.asin = t.album
  WHERE
    t.song = 'Alison'
  SQL
end

def exodus_artist
  # Select the name of the artist who recorded the song 'Exodus'.
  execute(<<-SQL)
  SELECT
  a.artist
  FROM
  albums a INNER JOIN tracks t
  ON a.asin = t.album
  WHERE
  t.song = 'Exodus'
  SQL
end

def blur_songs
  # Select the `song` for each `track` on the album `Blur`.
  execute(<<-SQL)
  SELECT
  t.song
  FROM
  albums a INNER JOIN tracks t
  ON a.asin = t.album
  WHERE
    a.title = 'Blur'
  SQL
end

def heart_tracks
  # For each album show the title and the total number of tracks containing
  # the word 'Heart' (albums with no such tracks need not be shown). Order by
  # the number of such tracks.
  execute(<<-SQL)
  SELECT
  a.title, count(t.song)
  FROM
  albums a INNER JOIN tracks t
  ON a.asin = t.album
  WHERE
  t.song LIKE '%Heart%'
  GROUP BY
  a.asin
  HAVING
   count(t.song) > 0
  ORDER BY
    count(t.song) DESC
  SQL
end

def title_tracks
  # A 'title track' has a `song` that is the same as its album's `title`. Select
  # the names of all the title tracks.
  execute(<<-SQL)
  SELECT
  t.song
  FROM
  albums a INNER JOIN tracks t
  ON a.asin = t.album
  WHERE
  t.song = a.title
  SQL
end

def eponymous_albums
  # An 'eponymous album' has a `title` that is the same as its recording
  # artist's name. Select the titles of all the eponymous albums.
  execute(<<-SQL)
  SELECT
  title
  FROM
  albums
  WHERE
  artist = title
  SQL
end

def song_title_counts
  # Select the song names that appear on more than two albums. Also select the
  # COUNT of times they show up.
  execute(<<-SQL)
  SELECT
    song, count(album)
  FROM
    tracks
  GROUP BY
    song
  HAVING
    count(album) > 2
  SQL
end

def best_value
  # A "good value" album is one where the price per track is less than 50
  # pence. Find the good value albums - show the title, the price and the number
  # of tracks.
  execute(<<-SQL)
  SELECT
    a.title, a.price, count(t.song)
  FROM
    albums a INNER JOIN tracks t
    ON a.asin = t.album
  GROUP BY
    a.asin
  HAVING
    a.price / count(t.song) < 0.50
  SQL
end

def top_track_counts
  # Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101
  # tracks. List the top 10 albums in order of track count. Select both the
  # album title and the track count.
  execute(<<-SQL)
  SELECT
    a.title, count(t.song)
  FROM
    albums a INNER JOIN tracks t
    ON a.asin = t.album
  GROUP BY
    a.asin
  ORDER BY
    count(t.song) DESC LIMIT 10
  SQL
end

def soundtrack_wars
  # Select the artist who has recorded the most soundtracks, as well as the
  # number of albums. HINT: use LIKE '%Soundtrack%' in your query.
  execute(<<-SQL)
  SELECT
    a.artist, count(a.asin)
  FROM
    albums a INNER JOIN styles s
    ON s.album = a.asin
  WHERE
    s.style LIKE '%Soundtrack%'
  GROUP BY
    a.artist
  ORDER BY
    count(a.asin) DESC LIMIT 1
  SQL
end

def expensive_tastes
  # Select the five styles of music with the highest average price per track,
  # along with the price per track. One or more of each aggregate functions,
  # subqueries, and joins will be required.
  execute(<<-SQL)
  SELECT
    s.style, sum(a.price) / sum(pt.count)
  FROM
    albums a INNER JOIN styles s
    ON s.album = a.asin
    INNER JOIN (SELECT
                  t.album album, count(t.posn)
                  FROM
                  albums a INNER JOIN tracks t
                  ON a.asin = t.album
                  GROUP BY
                  t.album ) pt
    ON a.asin = pt.album

  GROUP BY
    s.style
  HAVING
    sum(a.price) / sum(pt.count) IS NOT NULL

  ORDER BY
     sum(a.price) / sum(pt.count) DESC LIMIT 5

  SQL
end
