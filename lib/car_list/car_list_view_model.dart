
import 'package:flutter_riverpod/all.dart';

final CarListProvider =
    StateNotifierProvider<CarListState, List>((ref) => CarListState());

class Car {
  String name;
  String price;
  String image;
  int color;
  bool isFavorite;

  Car(this.name, this.price, this.image, this.color, this.isFavorite);

}

List carsState = [];

class CarListState extends StateNotifier<List> {
  CarListState() : super(carsState);

  void initializeData() {
    if (carsState.length == 0) {
      carsState.add(Car('Classic Car', '\$34/day', 'assets/image/car_classic.png', 0xFFB67853, false));
      carsState.add(Car('Sport Car', '\$55/day', 'assets/image/car_sport.png', 0xFF60B5F4, false));
      carsState.add(Car('Flying Car', '\$500/day', 'assets/image/car_flying.png', 0xFF8382C2, false));
      carsState.add(Car('Electric Car', '\$45/day', 'assets/image/car_electric.png', 0xFF2A3640, false));
    }
  }

  void favorited(index) {
    carsState[index].isFavorite = !carsState[index].isFavorite;
    state = carsState;
  }

  void getDataFromDetail(params) {
    int index = carsState.indexWhere((el) => el.name == params.name);
    print(index);
    carsState[index].isFavorite = params.isFavorite;
    state = carsState;
  }
}
