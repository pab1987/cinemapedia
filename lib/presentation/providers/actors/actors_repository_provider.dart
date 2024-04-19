import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider encargado para proveer el repositorio
//Este repositorio es inmutable y de solo lectura
final actorRepositoryProvider = Provider((ref) {

  return ActorRepositoryImpl(ActorMovieDbdatasource());
});
