import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:nosh_assintment/utils/widgets/fav/fav_heart.dart';

class CommonDishCardShimmer extends StatelessWidget {
  final bool? forFullView;
  const CommonDishCardShimmer({Key? key, this.forFullView = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(96, 96, 96, 96),
              blurRadius: 2,
              spreadRadius: 0.5),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: forFullView!
              ? double.infinity
              : MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder for image with shimmer effect
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Placeholder for title with shimmer effect
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // Placeholder for duration and type with shimmer effect
                      const SizedBox(height: 8.0),
                      // Placeholder for rating with shimmer effect
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Row(
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
                        ),
                      ),
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
