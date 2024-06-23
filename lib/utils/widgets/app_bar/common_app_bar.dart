import 'package:flutter/material.dart';
import 'package:nosh_assintment/feature/fav/view/fav_view.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const CommonAppBar({super.key, this.bottom});

  @override
  Size get preferredSize => Size.fromHeight(AppBar(
        bottom: bottom,
      ).preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Recipes',
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => FavScreen()));
          },
        )
      ],
      bottom: bottom,
    );
  }
}
