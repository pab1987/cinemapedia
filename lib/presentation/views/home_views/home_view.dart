import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/date_display_widget/date_display_widget.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topratedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final getUpcoming = ref.watch(upcomingMoviesProvider);
    final toRated = ref.watch(topratedMoviesProvider);

    final currentdate = CurrentDateWidget().getFormattedDate();

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 5),
            title: CustomAppbar(),
          ),
        ),
      
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(
                movies: slideshowMovies,
              
              ),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'In movie theaters',
                subTitle: currentdate,
                loadNextPage: () => ref
                    .read(nowPlayingMoviesProvider.notifier)
                    .loadNextPage(), //El read se usa dentro de callback o funciones
              ),
              MovieHorizontalListview(
                movies: getUpcoming,
                title: 'Coming soon',
                //subTitle: 'En este mes',
                loadNextPage: () => ref
                    .read(upcomingMoviesProvider.notifier)
                    .loadNextPage(), //El read se usa dentro de callback o funciones
              ),

              /* MovieHorizontalListview(
                movies: popularMovies,
                title: 'Popular',
                //subTitle: '',
                loadNextPage: () => ref
                    .read(popularMoviesProvider.notifier)
                    .loadNextPage(), //El read se usa dentro de callback o funciones
              ), */
              
              MovieHorizontalListview(
                movies: toRated,
                title: 'Best rated',
                //subTitle: 'De todos los tiempos',
                loadNextPage: () => ref
                    .read(topratedMoviesProvider.notifier)
                    .loadNextPage(), //El read se usa dentro de callback o funciones
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }, 
        
        childCount: 1))
      ]
    );
  }
}