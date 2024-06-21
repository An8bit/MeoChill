import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/models/movie.dart';

abstract class Api{
  Future<void> delay() async {
  }
  Future<void> conNect();
  Future<bool> checkLogin(Loginmodel login);
  Future<List<Map<String, dynamic>>> getListMovie();
  Future<List<Map<String,dynamic>>> getListDetails();
  Future<List<Map<String,dynamic>>> getListActor();
  Future<List<Map<String,dynamic>>> getListEpsilon(String id);
  Future<List<Map<String,dynamic>>> getMoviesResult();
  Future<List<Map<String,dynamic>>> resultListSearch();
  Future<List<Movie>> getTopTrending();
}
