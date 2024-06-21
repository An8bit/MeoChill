import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meochill/repostsitories/log.dart';
import 'constant.dart';

class MongoService implements Api {
  static var db;
  MongoService(LogApp read);
  

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
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
    List<Map<String, dynamic>> list =
        await collectionMovies.find(where.gte('view', 5000)).toList();
    List<Movie> movies = list.map((json) => Movie.fromJson(json)).toList();
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

  @override
  Future<List<Map<String, dynamic>>> resultListSearch() {
    // TODO: implement resultListSearch
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopTrending() async {
    var collectionMovies = db.collection(MOVIES_COLLECTION);

    // Lấy danh sách các bộ phim có lượt xem >= 5000
    List<Map<String, dynamic>> list = await collectionMovies.find(where.gte('view', 5000)).toList();
    List<Movie> movies = list.map((json) => Movie.fromJson(json)).toList();

    
    String value = "8";
    List<Map<String, dynamic>> listMovies = [];

    // Danh sách các trường cần tìm kiếm
    List<String> fields = ['name', 'slug', 'origin_name', 'content'];

    // Duyệt qua các trường 
    for (String field in fields) {
      var searchQuery = where.match(field, value, caseInsensitive: true);
      listMovies = await collectionMovies.find(searchQuery).toList();
      if (listMovies.isNotEmpty) {
        break;  // Nếu tìm thấy kết quả thì dừng lại
      }
    }
    
    
    List<Movie> movies1 = listMovies.map((json) => Movie.fromJson(json)).toList();

    return movies;
  }

  @override
  Future<void> delay() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
