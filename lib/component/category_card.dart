import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final int color;
  CategoryCard({this.icon, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Color(color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(height: 10.0),
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
        ),
      ),
      width: 60,
    );
  }
}
