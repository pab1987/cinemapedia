import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDb movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: (movieDb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
        : 'https://media.istockphoto.com/id/1265221960/es/vector/p%C3%A1gina-no-encontrada-error-con-dise%C3%B1o-de-solapa-de-pel%C3%ADcula.jpg?s=170667a&w=0&k=20&c=VJz23ZtTaOmgaEE2w24rVKe-vfQsv6XW0xlmQLiD9cM=',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: (movieDb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
        : 'no-poster'
      ),
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);
}
