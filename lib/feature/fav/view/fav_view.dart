import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh_assintment/feature/home/model/dishes_response_model.dart';
import 'package:nosh_assintment/feature/home/view/widgets/dish_of_the_day_widget.dart';
import 'package:nosh_assintment/feature/home/view_model/home_view_model.dart';
import 'package:nosh_assintment/utils/widgets/app_bar/common_app_bar.dart';
import 'package:nosh_assintment/utils/widgets/cards/common_card_widget.dart';

class FavScreen extends ConsumerStatefulWidget {
  const FavScreen({super.key});

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends ConsumerState<FavScreen> {
  TextStyle style = const TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal);

  // @override
  // void initState() {
  //   Future.microtask(() {
  //     ref.read(landingViewProvider.notifier).getDishes();
  //   });

  //   // Ref.read(homeViewFutureProvider(WidgetRef()));

  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final items = ref.watch(landingViewProvider);
        // final storage = ref.read(landingViewProvider);?
        return Scaffold(
          appBar: CommonAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.all(12),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      itemCount: ref
                          .watch(landingViewProvider.notifier)
                          .dishesData
                          .length,
                      itemBuilder: (context, index) {
                        // return Container(
                        //   height: 55,
                        // );
                        return ref
                                .watch(landingViewProvider.notifier)
                                .dishesData[index]
                                .isFav!
                            ? CommonDishCard(
                                pressedFav: (v) {
                                  ref
                                      .read(landingViewProvider.notifier)
                                      .tapFav(index);
                                },
                                isFav: ref
                                    .watch(landingViewProvider.notifier)
                                    .dishesData[index]
                                    .isFav,
                                title: ref
                                    .watch(landingViewProvider.notifier)
                                    .dishesData[index]
                                    .dishName!,
                                image: ref
                                    .watch(landingViewProvider.notifier)
                                    .dishesData[index]
                                    .imageUrl!,
                              )
                            : SizedBox.shrink();
                      },
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
