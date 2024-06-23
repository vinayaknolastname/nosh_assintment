import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(179, 205, 205, 205),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: const Color.fromARGB(141, 0, 0, 0),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Search',
            style: TextStyle(color: const Color.fromARGB(255, 52, 52, 52)),
          )
        ],
      ),
    );
  }
}
