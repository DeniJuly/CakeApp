import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magandhy_cake/component/category_card.dart';
import 'package:magandhy_cake/component/favorite_card.dart';
import 'package:magandhy_cake/component/recomendation_card.dart';

final List<String> imgList = [
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
];
final List<Map> categoryList = [
  {'icon': 'assets/icons/cake.svg', 'title': "Tart", 'color': 0xffFFD7D7},
  {'icon': 'assets/icons/pudding.svg', 'title': "Pudding", 'color': 0xff9BE8D4},
  {'icon': 'assets/icons/cookie.svg', 'title': "Cookie", 'color': 0xffFFE4A1},
  {'icon': 'assets/icons/pudding.svg', 'title': "Pudding", 'color': 0xffBEDCFA},
  {'icon': 'assets/icons/cookie.svg', 'title': "Cookie", 'color': 0xffFFE4A1},
  {'icon': 'assets/icons/cake.svg', 'title': "Tart", 'color': 0xffFFD7D7},
  {'icon': 'assets/icons/pudding.svg', 'title': "Pudding", 'color': 0xff9BE8D4},
  {'icon': 'assets/icons/cookie.svg', 'title': "Cookie", 'color': 0xffFFE4A1},
];

final List<Map> recomendationList = [
  {
    'image': 'assets/images/cake.png',
    'title': 'Cake rainy chocolate',
    'price': 'Rp20.000',
    'rate': '5.0'
  },
  {
    'image': 'assets/images/cake2.png',
    'title': 'Cake fruit with marmalade',
    'price': 'Rp20.000',
    'rate': '5.0'
  },
  {
    'image': 'assets/images/cake3.png',
    'title': 'Cake wedding',
    'price': 'Rp20.000',
    'rate': '5.0'
  },
];

final List<Map> favoriteList = [
  {
    'image': 'assets/images/cake4.png',
    'title': 'Cake rainy chocolate',
    'price': 'Rp20.000',
    'rate': '5.0'
  },
  {
    'image': 'assets/images/cake5.png',
    'title': 'Cute pudding with delicious strawberry',
    'price': 'Rp25.000',
    'rate': '5.0'
  },
  {
    'image': 'assets/images/cake6.png',
    'title': 'Donuts',
    'price': 'Rp25.000',
    'rate': '5.0'
  },
];

class Home extends StatelessWidget {
  ListView _buildCategoryCard() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryCard(
            icon: categoryList[index]['icon'],
            title: categoryList[index]['title'],
            color: categoryList[index]['color']);
      },
    );
  }

  ListView _buildRecomendationCard() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: recomendationList.length,
      itemBuilder: (BuildContext context, int index) {
        return RecomendationCard(
          image: recomendationList[index]['image'],
          title: recomendationList[index]['title'],
          price: recomendationList[index]['price'],
          rate: recomendationList[index]['rate'],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white));

    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              'assets/images/banner.png',
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
    MediaQueryData queryData = MediaQuery.of(context);

    final List<Widget> _buildFavoriteCard = favoriteList
        .map((data) => FavoriteCard(
              title: data['title'],
              image: data['image'],
              width: queryData.size.width,
              rate: data['rate'],
              price: data['price'],
            ))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/bg-home.png',
                  width: 200,
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Logo
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'LOGO',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://scontent.fcgk18-1.fna.fbcdn.net/v/t1.0-9/131471561_2930336917198881_2902553514573802450_o.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=DnnOLiFTcCUAX-XxfjA&_nc_ht=scontent.fcgk18-1.fna&oh=e701d7faab2fa46c357a2f91e12dc188&oe=607671DE'),
                          backgroundColor: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  //End Logo

                  //Carousel
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true, viewportFraction: 1.0, height: 150),
                    items: imageSliders,
                  ),
                  // End Carousel
                  SizedBox(
                    height: 20.0,
                  ),

                  // Category
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Category',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    child: _buildCategoryCard(),
                  ),
                  // End Category
                  SizedBox(
                    height: 20.0,
                  ),

                  // Rekomendasi
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Rekomendasi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  Container(height: 220, child: _buildRecomendationCard()),
                  // End Rekomendasi
                  SizedBox(
                    height: 20,
                  ),

                  // Favorite
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Paling Favorite',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  Column(children: _buildFavoriteCard),
                  // End Favorite
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
