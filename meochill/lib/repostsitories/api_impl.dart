import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';

//hi bro ở đây là các phương thức  lấy dữ liệu sever nhá nó kế thừa từ class api thêm phương thức gì thì cứ qua bên api lấy rồi fix lại


class ApiImpl implements Api {
  Future<void> deplay() async {
    await Future.delayed(const Duration(seconds: 1));
  }
  @override
  Future<void> CheckLogin(Loginmodel login) async {
    // TODO: implement CheckLogin
   await deplay();
    if(login.username ==1 && login.password==1)
    return Future(() => true);
    return Future(() => false);
  }
  
  @override
  Future<void> checkLogin(Loginmodel login) {
    // TODO: implement checkLogin
    throw UnimplementedError();
  }
  
  @override
  Future<void> conNect() {
    // TODO: implement conNect
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopTrending() {
    // TODO: implement getTopTrending
    throw UnimplementedError();
  }
  
  @override
  Future<List<Movie>> getResultFilm(String query) {
    // TODO: implement getResultFilm
    throw UnimplementedError();
  }
  
}