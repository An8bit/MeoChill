import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:meochill/widget/screens/sort/tab_controller.dart';

class SortScreen extends StatelessWidget {
  const SortScreen({super.key});
  
   @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<String> bannerUrls = [
     
      "https://phim.nguonc.com/public/images/Film/kim-ngo-ve-phong-khoi-kim-lang.jpg",
       "https://phim.nguonc.com/public/images/Film/hDvqcbZhq9ux0euxYxCP9N6m1Rh.jpg",
       "https://phim.nguonc.com/public/images/Film/6464530c7cd09145533532.jpeg",
       "https://phim.nguonc.com/public/images/Post/3/sieu-anh-hung-pha-hoai-phan-4-1.jpg",
        "https://phim.nguonc.com/public/images/Film/140306.jpg",
       
    
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.25), // Chiều cao của AppBar
        child: AppBar(
        backgroundColor: Colors.black,
          title: const Text("Movies World",style: TextStyle(color: Colors.grey),),
          flexibleSpace: Swiper(
            
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                bannerUrls[index],
                fit: BoxFit.scaleDown,
               
                height: size.height*0.25,
                
              );
              
            },
            pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.red,
                    color: Colors.white,
                  )),
            itemCount: bannerUrls.length,
            autoplay: true,
            autoplayDelay: 3000,
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Các nội dung khác của trang
          Expanded(
            child:CustomTabBar(),
          ),
        ],
      ),
    );
  }
}