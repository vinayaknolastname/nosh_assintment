import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nosh_assintment/utils/widgets/fav/fav_heart.dart';

class CommonDishCard extends StatelessWidget {
  final String title;
  final String image;
  final bool? isFav;
  final Function pressedFav;
  const CommonDishCard(
      {super.key,
      required this.image,
      required this.title,
      required this.pressedFav,
      this.isFav = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(58, 96, 96, 96),
                blurRadius: 2,
                spreadRadius: 0.5)
          ]),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //               decoration: BoxDecoration(
                // borderRadius: B
                //               ),
                width: double.infinity,
                height: 180,

                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      image,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    GestureDetector(
                      onTap: () {
                        pressedFav(true);
                      },
                      child: FavHeartWidget(
                        isFav: isFav!,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.black,
                            size: 14,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "20 minutes",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 7,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Vegetarian",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: const Color.fromARGB(255, 96, 96, 96),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
