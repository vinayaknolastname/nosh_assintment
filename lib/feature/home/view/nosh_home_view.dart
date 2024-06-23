import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh_assintment/feature/home/model/dishes_response_model.dart';
import 'package:nosh_assintment/feature/home/view/widgets/dish_of_the_day_widget.dart';
import 'package:nosh_assintment/feature/home/view_model/home_view_model.dart';
import 'package:nosh_assintment/services/connectivity/internet_service.dart';
import 'package:nosh_assintment/utils/widgets/app_bar/common_app_bar.dart';
import 'package:nosh_assintment/utils/widgets/cards/common_card_widget.dart';
import 'package:nosh_assintment/utils/widgets/shimmer/common_card_shimmer.dart';

class NoshHomeScreen extends ConsumerStatefulWidget {
  const NoshHomeScreen({super.key});

  @override
  _NoshHomeScreenState createState() => _NoshHomeScreenState();
}

class _NoshHomeScreenState extends ConsumerState<NoshHomeScreen> {
  TextStyle style = const TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal);

  @override
  void initState() {
    ConnectivityUtil().isInternetAvailable(context);
    Future.microtask(() {
      ref.read(landingViewProvider.notifier).getDishes();
    });

    // Ref.read(homeViewFutureProvider(WidgetRef()));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final items = ref.watch(landingViewProvider);
        // final storage = ref.read(landingViewProvider);?
        return Scaffold(
          appBar: CommonAppBar(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: 0,
            type: BottomNavigationBarType.fixed, //
            // unselectedLabelStyle: TextStyle(color: Colors.grey),
            // fixedColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.amber[800],
            onTap: (d) {},
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DishOfTheDayWidget(
                      img:
                          "https://nosh-assignment.s3.ap-south-1.amazonaws.com/rabdi.jpg" ??
                              "",
                      text: "Rabdi" ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Discover Regional Delight",
                        style: style.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 310,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: items.length == 0
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return CommonDishCardShimmer();
                              },
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return CommonDishCard(
                                  isFav: items[index].isFav,
                                  title: items[index].dishName!,
                                  image: items[index].imageUrl!,
                                  pressedFav: (v) {
                                    ref
                                        .read(landingViewProvider.notifier)
                                        .tapFav(index);
                                  },
                                );
                              },
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    items.length == 0
                        ? CommonDishCardShimmer(
                            forFullView: true,
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(12),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              // return Container(
                              //   height: 55,
                              // );
                              return CommonDishCard(
                                pressedFav: (v) {
                                  ref
                                      .read(landingViewProvider.notifier)
                                      .tapFav(index);
                                },
                                isFav: items[index].isFav,
                                title: items[index].dishName!,
                                image: items[index].imageUrl!,
                              );
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
