import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavHeartWidget extends StatelessWidget {
  final bool? isFav;
  const FavHeartWidget({super.key, this.isFav = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.favorite,
        color: isFav! ? Colors.red : const Color.fromARGB(161, 158, 158, 158),
      ),
    );
  }
}
