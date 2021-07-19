
import 'package:daily_task/core/models/car_model.dart';
import 'package:daily_task/core/services/car_service.dart';
import 'package:flutter_riverpod/all.dart';

final CarListProvider =
    StateNotifierProvider<CarListState, List<Car>>((ref) => CarListState(ref.read(CarServiceProvider)));

class CarListState extends StateNotifier<List<Car>> {
  final CarService _carService;
  CarListState(this._carService) : super([]){
    initialize();
  }

  void initialize() {
    state = _carService.fetchCar();
  }

  void favorited(index) {
    _carService.setFavorite(index);
    state = _carService.fetchCar();
  }

}
