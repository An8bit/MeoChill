import 'package:meochill/models/category.dart';
import 'package:meochill/models/episode.dart';
import 'package:meochill/models/loginmodel.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../models/movie.dart';

abstract class Api{
  Future<void> conNect();
  Future<bool> checkLogin(Loginmodel login);
  Future<List<Map<String, dynamic>>> getListMovie();
  Future<List<Map<String,dynamic>>> getListDetails();
  Future<List<Map<String,dynamic>>> getListActor();
  Future<List<Map<String,dynamic>>> getListEpsilon(String id);
  Future<List<Map<String,dynamic>>> getMoviesResult();
  Future<List<Movie>> getTopTrending();
  Future<List<Movie>> getResultFilm(String query);
  Future<List<Movie>> getTypeMovie(String type);
  Future<List<Movie>> getMovieByCategoryId(String categoryId);
  Future<String> getCategoryId(String category);
  Future<List<Movie>> getRecommandMovie();
  Future<List<String>> getNameCategory(List<String> idcategory);
  Future<List<Episode>> getEpisode(ObjectId id);
}
