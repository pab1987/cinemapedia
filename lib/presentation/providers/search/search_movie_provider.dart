import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

final searchQUeryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMoviesNotifier(
      searchMovieCallback: movieRepository.searchMovie, ref: ref);
});

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMovieCallback searchMovieCallback;
  final Ref ref;

  SearchedMoviesNotifier({required this.searchMovieCallback, required this.ref})
      : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovieCallback(query);
    ref.read(searchQUeryProvider.notifier).update((state) => query);
    state = movies;

    return movies;
  }
}
