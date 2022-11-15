import 'package:retrofit_test/src/model/movie/movie_model.dart';
import 'package:retrofit_test/src/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieModel>();

  Stream<MovieModel> get movies => _moviesFetcher.stream;

  void fetchAllMovies() async {
    MovieModel movieModel = await _repository.movieProvider.getMovie();
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final moviesBloc = MoviesBloc();
