import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nosh_assintment/utils/widgets/search_bar/common_search_bar.dart';

class DishOfTheDayWidget extends StatelessWidget {
  String img;
  String text;
  DishOfTheDayWidget({super.key, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
    return Container(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          CachedNetworkImage(
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              imageUrl: img),
          Container(
            padding: EdgeInsets.all(20).copyWith(top: 10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonSearchBar(),
                Spacer(),
                Text(
                  'Dish of the Day',
                  style:
                      style.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  text,
                  style: style.copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
