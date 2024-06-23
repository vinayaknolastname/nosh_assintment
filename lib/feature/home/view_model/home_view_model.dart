import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh_assintment/feature/home/model/dishes_response_model.dart';
import 'package:nosh_assintment/services/api/api_constants.dart';
import 'package:nosh_assintment/services/api/base_http.dart';

final landingViewProvider =
    StateNotifierProvider<LandingViewModel, List<DishesResponseModel>>(
        (ref) => LandingViewModel());

class LandingViewModel extends StateNotifier<List<DishesResponseModel>> {
  LandingViewModel() : super([]);
  BaseHttpService httpService = BaseHttpService();

  List<DishesResponseModel> dishesData = <DishesResponseModel>[];
  Future<bool> getDishes() async {
    try {
      state = [];
      final res = await httpService.getRequest(ApiConstants.getDishes);

      final decoded = await json.decode(res.body);

      for (var i = 0; i < decoded.length; i++) {
        var dish = DishesResponseModel.fromJson(decoded[i]);
        dishesData.add(dish);
      }

      print(dishesData);

      await Future.delayed(Duration(seconds: 2));
      state = dishesData;
      return true;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  tapFav(int index) async {
    try {
      state = [];
      // final res = await httpService.getRequest(ApiConstants.getDishes);

      // final decoded = await json.decode(res.body);

      // for (var i = 0; i < decoded.length; i++) {
      //   var dish = DishesResponseModel.fromJson(decoded[i]);
      //   dishesData.add(dish);
      // }

      dishesData[index].isFav = !dishesData[index].isFav!;
      state = dishesData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
