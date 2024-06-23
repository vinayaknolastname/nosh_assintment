class DishesResponseModel {
  String? dishName;
  String? dishId;
  String? imageUrl;
  bool? isFav;

  DishesResponseModel({this.dishName, this.dishId, this.imageUrl, this.isFav});

  DishesResponseModel.fromJson(Map<String, dynamic> json) {
    dishName = json['dishName'];
    dishId = json['dishId'];
    imageUrl = json['imageUrl'];
    isFav = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dishName'] = this.dishName;
    data['dishId'] = this.dishId;
    data['imageUrl'] = this.imageUrl;

    return data;
  }
}
