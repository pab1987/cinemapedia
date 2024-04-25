import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/search/search_movie_provider.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary,),
              const SizedBox(width: 5,),
              Text('PosterFilm', style: titleStyle,),
              const Spacer(),
              IconButton(
                onPressed: (){
                  final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQUeryProvider);
                  
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context, 
                    delegate: SearchMovieDelegate(
                      initialMovies: searchedMovies,
                      searchMoviesCallback: ref.read(searchedMoviesProvider.notifier).searchMovieByQuery
                    )
                  ).then((movie) {
                    //Se navega a la pelicula buscada
                    if(movie == null)return;
                    context.push('/movie/${ movie.id }');
                  });
                }, 
                icon: const Icon(Icons.search))
            ],
          ),
        ),
      )
    );
  }
}