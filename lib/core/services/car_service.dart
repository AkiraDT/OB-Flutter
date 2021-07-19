import 'package:daily_task/core/models/car_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CarServiceProvider = Provider<CarService>((ref) => CarService());

class CarService {
  List<Car> carState = [
    Car('Classic Car', '\$34/day', 'assets/image/car_classic.png', 0xFFB67853, false),
    Car('Sport Car', '\$55/day', 'assets/image/car_sport.png', 0xFF60B5F4, false),
    Car('Flying Car', '\$500/day', 'assets/image/car_flying.png', 0xFF8382C2, false),
    Car('Electric Car', '\$45/day', 'assets/image/car_electric.png', 0xFF2A3640, false),
  ];

  void setFavorite(index) {
    Car newCar = new Car(carState[index].name, carState[index].price, carState[index].image, carState[index].color, !carState[index].isFavorite);
    carState[index] = newCar;
  }

  List<Car> fetchCar() {
    return carState;
  }
}
