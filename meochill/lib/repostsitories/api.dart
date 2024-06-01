import 'package:meochill/models/loginmodel.dart';

abstract class Api{
  Future<void> CheckLogin(Loginmodel login);
  
}