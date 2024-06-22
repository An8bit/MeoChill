import 'package:meochill/models/loginmodel.dart';

import '../models/movie.dart';

abstract class Api{
  Future<void> conNect();
  Future<void> checkLogin(Loginmodel login);
  Future<List<Movie>> getTopTrending();
  Future<List<Movie>> getResultFilm(String query);
}