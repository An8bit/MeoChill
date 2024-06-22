
import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/contanst.dart';
import 'package:meochill/repostsitories/log.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoService implements Api {
  static var db;
  MongoService(LogApp read);

  @override
  Future<void> checkLogin(Loginmodel login) {
    // TODO: implement checkLogin
    throw UnimplementedError();
  }

  @override
  Future<void> conNect() async {
    db = await Db.create(DATABASE_DATA_API);
    await db.open();
  }

  @override
  Future<List<Movie>> getTopTrending() async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
    //truy van lon hon 5000 view
    List<Map<String, dynamic>> list =
        await collectionMovies.find(where.gte('view', 4999)).toList();
    List<Movie> movies = list.map((json) => Movie.fromJson(json)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getResultFilm(String query) async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
     List<Map<String, dynamic>>  listmovies =[];
    List<String>filelds = ['name','slug','origin_name','content'];
    for (String field in filelds){
      var searchQuery = where.match(field, query,caseInsensitive: true);
      listmovies = await  collectionMovies.find(searchQuery).toList();
      if(listmovies.isNotEmpty){
        break;
      }
    }
    
    List<Movie> movies = listmovies.map((json) => Movie.fromJson(json)).toList();
    
    if (listmovies.isNotEmpty) {
      return movies;
    } else {
      return [];
    }
  }
}
