import 'package:dio/dio.dart';
import 'package:retrofit_test/src/model/item/movie_model.dart';
import 'package:retrofit_test/src/resource/movie_provider/movie_provider.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _moviesFetcher = PublishSubject<MovieModel>();

  Stream<MovieModel> get allMovies => _moviesFetcher.stream;

  void fetchAllMovies() async {
    final dio = Dio();
    final movieProvider = MovieProvider(dio);
    MovieModel movieModel = await movieProvider.getTasks();
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
