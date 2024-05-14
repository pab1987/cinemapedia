import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoriteView> {
  bool isLastpage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastpage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();

    isLoading = false;

    if (movies.isEmpty) {
      isLastpage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border_sharp,
              size: 60,
              color: colors.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Oh, no tienes películas favoritas!',
              style: TextStyle(color: colors.primary, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton.tonal(
                onPressed: () => context.go('/'),
                child: const Text(
                  'Agregar favoritas',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      );
    }

    return Scaffold(
        body: MovieMasonry(loadNextPage: loadNextPage, movies: favoriteMovies));
  }
}
