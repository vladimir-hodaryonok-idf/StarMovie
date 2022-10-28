import 'package:data/src/database/dto/movie_dto.dart';
import 'package:domain/domain.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'PeopleWithImageDto', primaryKeys: const [
  'trakt',
  'movieId',
], foreignKeys: const [
  ForeignKey(
    childColumns: ['movieId'],
    parentColumns: ['trakt'],
    entity: MovieDto,
    onDelete: ForeignKeyAction.cascade,
  ),
])
class PeopleWithImageDto {
  final String? character;
  final List<String>? characters;
  final String? name;
  final int? trakt;
  final String? slug;
  final String? imdb;
  final int? tmdb;
  final int? tvrage;
  final String imageUrl;
  final int movieId;

  const PeopleWithImageDto(
    this.character,
    this.characters,
    this.name,
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
    this.tvrage,
    this.imageUrl,
    this.movieId,
  );

  factory PeopleWithImageDto.fromPeopleAndId(
    PeopleWithImage peoples,
    int movieId,
  ) =>
      PeopleWithImageDto(
        peoples.character,
        peoples.characters,
        peoples.person?.name,
        peoples.person?.ids?.trakt,
        peoples.person?.ids?.slug,
        peoples.person?.ids?.imdb,
        peoples.person?.ids?.tmdb,
        peoples.person?.ids?.tvrage,
        peoples.imageUrl,
        movieId,
      );

  PeopleWithImage toPeoplesWithImages() => PeopleWithImage(
        character: character,
        characters: characters,
        person: Person(
          name: name,
          ids: PeopleIds(
            trakt: trakt,
            slug: slug,
            imdb: imdb,
            tmdb: tmdb,
            tvrage: tvrage,
          ),
        ),
        imageUrl: imageUrl,
      );
}
