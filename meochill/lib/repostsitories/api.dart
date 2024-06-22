import 'package:meochill/models/loginmodel.dart';

import '../models/movie.dart';

abstract class Api{
  Future<void> conNect();
<<<<<<< HEAD
  Future<bool> checkLogin(Loginmodel login);
  Future<List<Map<String, dynamic>>> getListMovie();
  Future<List<Map<String,dynamic>>> getListDetails();
  Future<List<Map<String,dynamic>>> getListActor();
  Future<List<Map<String,dynamic>>> getListEpsilon(String id);
  Future<List<Map<String,dynamic>>> getMoviesResult();
}
=======
  Future<void> checkLogin(Loginmodel login);
  Future<List<Movie>> getTopTrending();
  Future<List<Movie>> getResultFilm(String query);
}
>>>>>>> origin/navigationthuan2
