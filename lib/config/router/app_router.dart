// ignore: depend_on_referenced_packages
import 'package:cinemapedia/presentation/views/home_views/popular_view.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomeScreen(childView: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeView(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no.id';
                    return MovieScreen(movieId: movieId);
                  },
                )
              ]
            )
          ]
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/popular', 
              builder: (context, state) => const PopularView(),
            )
          ]
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites', 
              builder: (context, state) => const FavoriteView(),
            )
          ]
        ),

      ]
    )
  ]
);
  
