import 'package:bson/src/classes/object_id.dart';
import 'package:meochill/models/category.dart';
import 'package:meochill/models/episode.dart';
import 'package:meochill/models/account.dart';
import 'package:meochill/models/favorite.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/log.dart';

//hi bro ở đây là các phương thức  lấy dữ liệu sever nhá nó kế thừa từ class api thêm phương thức gì thì cứ qua bên api lấy rồi fix lại
//LỚP GÁN CỨNG ĐỂ TEST

class ApiImpl implements Api {
  ApiImpl(LogApp read);
   
  
  Future<void> delay() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  
  @override
  Future<List<Map<String, dynamic>>> getListActor() {
    // TODO: implement getListActor
    throw UnimplementedError();
  }
  
  @override
  Future<List<Map<String, dynamic>>> getListDetails() async {
    throw UnimplementedError();
  }
  
  @override
  Future<List<Map<String, dynamic>>> getListMovie() {
    // TODO: implement getListMovie
    throw UnimplementedError();
  }
  
  @override
  Future<List<Map<String, dynamic>>> getListEpsilon(String id) {
    // TODO: implement getListEpsilon
    throw UnimplementedError();
  }
  

  
  @override
  Future<List<Map<String, dynamic>>> getMoviesResult() {
    // TODO: implement getMoviesResult
    throw UnimplementedError();
  }
  
  @override
  Future<bool> checkLogin(Account login) async {
    await delay();
    if(login.username == 1 && login.password ==1) {
      return Future(() => true);
    }
    return Future(() => false);
  }
  
  @override
  Future<void> conNect() {
    // TODO: implement conNect
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getResultFilm(String query) {
    // TODO: implement getResultFilm
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getTopTrending() {
    // TODO: implement getTopTrending
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getTypeMovie(String type) {
    // TODO: implement getTypeMovie
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getMovieByCategoryId(String category) {
    // TODO: implement getMovieByCategoryId
    throw UnimplementedError();
  }

  @override
  Future<String> getCategoryId(String category) {
    // TODO: implement getCategoryId
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getRecommandMovie() {
    // TODO: implement getRecommandMovie
    throw UnimplementedError();
  }
  
  @override
  Future<List<String>> getNameCategory(List<String> idcategory) {
    // TODO: implement getNameCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Episode>> getEpisode(ObjectId id) {
    // TODO: implement getEpisode
    throw UnimplementedError();
  }
  
  @override
  Future<bool> registerAccount(Account account) {
    // TODO: implement registerAccoun
    throw UnimplementedError();
  }
  
  @override
  Future<bool> checkAccount(Account account) {
    // TODO: implement checkAccount
    throw UnimplementedError();
  }
  
  @override
  Future<List<Account>> getListAccountByUserName(String email) {
    // TODO: implement getListAccountByUserName
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getListFavorite(String email) {
    // TODO: implement getListFavorite
    throw UnimplementedError();
  }
  
  @override
  Future<bool> buyPremium(String email) {
    // TODO: implement buyPremium
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getPremiumMovie() {
    // TODO: implement getPremiumMovie
    throw UnimplementedError();
  }
  
  @override
  Future<bool> addFavorite(String email, String id) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }
  
  @override
  Future<bool> deleteFavorite(String email, String id) {
    // TODO: implement deleteFavorite
    throw UnimplementedError();
  }
  
  @override
  Future<bool> checkFavorite(String mail , String id) {
    // TODO: implement checkFavorite
    throw UnimplementedError();
  }
  
 
}
