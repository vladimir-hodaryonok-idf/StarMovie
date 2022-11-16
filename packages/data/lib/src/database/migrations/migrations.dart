import 'package:floor/floor.dart';

class Migrations {
  Migrations._();

  static Migration migration1to2 = Migration(1, 2, (database) async {
    /// Merge MovieTrending and MovieAnticipated

    await database.execute('CREATE TABLE IF NOT EXISTS `MovieDto` '
        '('
        'watchers INTEGER, listCount INTEGER, title TEXT, year INTEGER,trakt INTEGER,'
        'slug TEXT, imdb TEXT, tmdb INTEGER, tagline TEXT, overview TEXT, released TEXT,'
        'runtime INTEGER, country TEXT, trailer TEXT, homepage TEXT, status TEXT, rating REAL,'
        'votes INTEGER, commentCount INTEGER, updatedAt TEXT, language TEXT, '
        'availableTranslations TEXT, genres TEXT, certification TEXT,'
        'PRIMARY KEY (trakt)'
        ')');
    await database.execute('INSERT INTO MovieDto ('
        'watchers, title, year, trakt, slug, imdb, tmdb, tagline, overview, released, '
        'runtime, country, trailer, homepage, status, rating, votes, commentCount, '
        'updatedAt, language, availableTranslations, genres, certification'
        ') SELECT * FROM MovieTrendingDto');
    await database.execute('INSERT INTO MovieDto ('
        'listCount, title, year, trakt, slug, imdb, tmdb, tagline, overview, released, '
        'runtime, country, trailer, homepage, status, rating, votes, commentCount, '
        'updatedAt, language, availableTranslations, genres, certification'
        ') SELECT * FROM MovieAnticipatedDto');
    await database.execute('DROP TABLE IF EXISTS MovieTrendingDto');
    await database.execute('DROP TABLE IF EXISTS MovieAnticipatedDto');

    /// PeopleWithImageDto change primary keys and add foreign key

    await database.execute('CREATE TABLE IF NOT EXISTS PeopleWithImageDtoTemp'
        '(character TEXT, characters TEXT, name TEXT, trakt INTEGER, '
        'slug TEXT, imdb TEXT, tmdb INTEGER, tvrage INTEGER, '
        'imageUrl TEXT NOT NULL, movieId INTEGER NOT NULL, '
        'FOREIGN KEY (movieId) REFERENCES MovieDto (trakt) '
        'ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (trakt, movieId))');
    await database.execute('INSERT INTO PeopleWithImageDtoTemp '
        'SELECT * FROM PeopleWithImageDto');
    await database.execute('DROP TABLE IF EXISTS PeopleWithImageDto');
    await database.execute('ALTER TABLE PeopleWithImageDtoTemp '
        'RENAME TO PeopleWithImageDto');

    /// create DateDto

    await database.execute('CREATE TABLE IF NOT EXISTS DateDto'
        '(key INTEGER NOT NULL, date INTEGER, PRIMARY KEY (key))');
  });

  static Migration migration2to3 = Migration(2, 3, (database) async {
    await database.execute('DELETE FROM PeopleWithImageDto');
  });
}
