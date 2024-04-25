// ignore: dangling_library_doc_comments
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_repository_provider.dart';


final movieIfoProvider  = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieById;

  return MovieMapNotifier(
    getMovie: getMovie
  );
});

/* final movieIfoProvider  = StateNotifierProvider((ref) {
  final getMovie = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(
    getMovie: getMovie.getMovieById
  );
}); */

///Clase para mantener en caché lla película que quiero mostrar al dar click a 
///cualquier pelicula.

  typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  GetMovieCallback getMovie;
  
  MovieMapNotifier({
    required this.getMovie
  }):super({});

  Future<void> loadMovie(String movieId) async {
    if(state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}