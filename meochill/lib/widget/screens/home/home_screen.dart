import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:meochill/models/movie2.dart';
=======
import 'package:meochill/models/Movie.dart';
>>>>>>> 401cf04 (WIP: Commit current changes)
import 'package:meochill/widget/screens/details/details_screen.dart';


class HomeScreen extends StatelessWidget {
  static const String route  = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeowChil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieHomePage(),
    );
  }
}

class MovieHomePage extends StatelessWidget {
 List<Movie> nowShowingMovies = [
    Movie(title: 'Spiderman', rating: '9.1/10 IMDb', imageUrl: 'assets/spiderman.jpg'),
    Movie(title: 'Eternals', rating: '9.5/10 IMDb', imageUrl: 'assets/eternals.jpg'),
    Movie(title: 'Shang Chi', rating: '8.9/10 IMDb', imageUrl: 'assets/shangchi.jpg'),
  ];

   List<Movie> popularMovies = [
    Movie(title: 'Venom Let There Be Carnage', rating: '6.4/10 IMDb', imageUrl: 'assets/venom.jpg', additionalInfo: '1h 47m | Horror | Mystery | Thriller'),
    Movie(title: 'The King\'s Man', rating: '8.4/10 IMDb', imageUrl: 'assets/kingsman.jpg', additionalInfo: '2h 11m | Action | Fantasy'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeowChil'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40, // Avatar size
                      backgroundImage: NetworkImage("https://example.com/user-avatar.jpg"), 
                    ),
                    SizedBox(height: 8), // Space between the avatar and the text
                    Text("User Name", style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text("user@example.com", style: TextStyle(color: Colors.white, fontSize: 14)), 
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Thể loại phim'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Năm sản xuất'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Đạo diễn'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Now Showing', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowShowingMovies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(movie: nowShowingMovies[index]),
                        ),
                      );
                    },
                    child: MovieCardHorizontal(movie: nowShowingMovies[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Popular', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: popularMovies[index]),
                      ),
                    );
                  },
                  child: MovieCardVertical(movie: popularMovies[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCardHorizontal extends StatelessWidget {
  final Movie movie;

  MovieCardHorizontal({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(movie.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Text(movie.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(movie.rating, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class MovieCardVertical extends StatelessWidget {
  final Movie movie;

  MovieCardVertical({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(movie.imageUrl, width: 100, height: 150, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(movie.rating, style: TextStyle(fontSize: 16)),
                  Text(movie.additionalInfo ?? '', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


