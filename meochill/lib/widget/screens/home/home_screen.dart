
import 'package:flutter/material.dart';
import 'package:meochill/models/movie2.dart';
import 'package:card_swiper/card_swiper.dart';
class filmScreen extends StatefulWidget {
  const filmScreen({super.key});
  @override
  State<filmScreen> createState() => _filmScreenState();
}

class _filmScreenState extends State<filmScreen> {
  
  final List<String> bannerUrls = [
    "https://img.ophim.live/uploads/movies/cach-cuop-ngan-hang-poster.jpg",
    "https://img.ophim.live/uploads/movies/joker-dien-co-doi-poster.jpg",
    "https://img.ophim.live/uploads/movies/lang-ma-am-poster.jpg"
  ];
   
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Movies World"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:SingleChildScrollView(child:  Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  bannerUrls[index],
                  fit: BoxFit.contain,
                );
              },
              itemCount: bannerUrls.length,
              pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                color: Colors.white,
              )),
              autoplay: true,
              autoplayDelay: 3000,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          TitleBody("Phổ biến"),
          const SizedBox(height: 15,),
           ListTopMovie(),
           TitleBody("Xem nhiều"),
          const SizedBox(height: 15,),
           ListTopMovie(),
           TitleBody("Xem nhiều tuần này"),
          const SizedBox(height: 15,),
           ListTopMovie(),
           TitleBody("Phim mới đề xuất"),
          const SizedBox(height: 15,),
           ListTopMovie(),
          
        ],
      ),)
    );
  }

  Padding TitleBody(String title) {
    return   Padding(
           padding:  EdgeInsets.symmetric(horizontal: 16.0), //
          child:   Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
             
            ),
          ),
        );
        
  }
}
 SingleChildScrollView ListTopMovie() {

  final List<Movie> nowShowingMovies = [
    Movie(
        title: 'Spiderman',
        rating: '9.1/10 IMDb',
        imageUrl: 'assets/spiderman.jpg'),
    Movie(
        title: 'Eternals',
        rating: '9.5/10 IMDb',
        imageUrl: 'assets/eternals.jpg'),
    Movie(
        title: 'Shang Chi',
        rating: '8.9/10 IMDb',
        imageUrl: 'assets/shangchi.jpg'),
  ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nowShowingMovies.length,
              itemBuilder: (context, index) {
                
                final movie = nowShowingMovies[index];
                return Container(
                  width: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            movie.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(movie.rating),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
}



