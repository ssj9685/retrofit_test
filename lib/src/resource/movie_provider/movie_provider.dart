import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/src/model/movie/movie_model.dart';

part 'movie_provider.g.dart';

const _apiKey = 'b24bd73e7a78904f9d8443f3c69c1669';

@RestApi(baseUrl: "https://api.themoviedb.org")
abstract class MovieProvider {
  factory MovieProvider(Dio dio) = _MovieProvider;

  @GET("/3/movie/popular")
  Future<MovieModel> getMovie({
    @Query("api_key") String apiKey = _apiKey,
  });
}
