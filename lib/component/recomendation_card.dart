import 'package:flutter/material.dart';

class RecomendationCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rate;
  RecomendationCard({this.image, this.title, this.price, this.rate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  child: SizedBox(
                    width: 105,
                    height: 105,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: 105,
                        height: 105,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffF6F6F6)),
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Color(0xffE8E8E8),
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffFDB827)),
                      ),
                      Text(
                        rate,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffFDB827)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
