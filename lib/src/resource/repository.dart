import 'package:dio/dio.dart';
import 'package:retrofit_test/src/resource/movie_provider/movie_provider.dart';

class Repository {
  final movieProvider = MovieProvider(Dio());
}
