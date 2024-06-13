import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meochill/repostsitories/log.dart';
import 'constant.dart';

class MongoService implements Api {

  
  static var db;
  MongoService(LogApp read);
  late DbCollection collection;
  
  @override
  Future<List<Map<String, dynamic>>> getListActor() {
    // TODO: implement getListActor
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getListDetails() async {
    return await db.collection(CATEGORY_COLLECTION).find().toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getListEpsilon(String id) {
    // TODO: implement getListEpsilon
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getListMovie() {
    // TODO: implement getListMovie
    throw UnimplementedError();
  }

  @override
  Future<bool> checkLogin(Loginmodel login) async {
   
    var user_colection = await db.collection(USER_COLLECTION);
    var u = await user_colection.findOne(
        where.eq("username", login.username).eq("password", login.password));

    return u != null;
  }

  @override
  Future<List<Map<String, dynamic>>> getMoviesResult() {
    // TODO: implement getMoviesResult
    throw UnimplementedError();
  }
  
  @override
  Future<void> conNect() async {
    db = await Db.create(DATABASE_DATA_API);
    await db.open();
  }
}
