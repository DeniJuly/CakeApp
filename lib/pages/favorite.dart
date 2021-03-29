import 'package:flutter/material.dart';
import 'package:magandhy_cake/component/favorite_card.dart';

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

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: Container(
          width: queryData.size.width,
          height: queryData.size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'FAVORITE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(children: _buildFavoriteCard),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
