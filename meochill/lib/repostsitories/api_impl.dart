import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/log.dart';

//hi bro ở đây là các phương thức  lấy dữ liệu sever nhá nó kế thừa từ class api thêm phương thức gì thì cứ qua bên api lấy rồi fix lại


class ApiImpl implements Api {
  ApiImpl(Log read);

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
  
}