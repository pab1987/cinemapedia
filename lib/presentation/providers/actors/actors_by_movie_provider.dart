import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorsByMovieProvider  = StateNotifierProvider<ActorMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorRepositoryProvider);

  return ActorMovieNotifier(getActor: actorsRepository.getActorsByMovie);
});

typedef GetActorByMovieCallback = Future<List<Actor>>Function(String movieId);

class ActorMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {

  GetActorByMovieCallback getActor;
  
  ActorMovieNotifier({
    required this.getActor
  }):super({});

  Future<void> loadActors(String movieId) async {
    if(state[movieId] != null) return;
    final actors = await getActor(movieId);
    state = {...state, movieId: actors};
  }
}