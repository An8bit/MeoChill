import 'package:meochill/models/loginmodel.dart';
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
  Future<bool> checkLogin(Loginmodel login) async {
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
  
 
  
}