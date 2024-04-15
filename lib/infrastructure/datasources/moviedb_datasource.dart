import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasourses/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mappper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));


List<Movie> _jsonToMovies(Map<String, dynamic> json){
  final movieDBReaponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBReaponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster' )
        .map((movieDb) => MovieMapper.movieDBToEntity(movieDb))
        .toList();
    return movies;
}
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular', 
      queryParameters: {
        'page': page
      }
    );
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getToRated({int page = 1})async{
    final response = await dio.get(
      '/movie/top_rated', 
      queryParameters: {
        'page': page
      }
    );
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1})async {
    final response = await dio.get(
      '/movie/upcoming', 
      queryParameters: {
        'page': page
      }
    );
    return _jsonToMovies(response.data);
  }
}