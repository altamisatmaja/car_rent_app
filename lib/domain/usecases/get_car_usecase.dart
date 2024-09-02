import 'package:car_rent_app/data/models/car_model.dart';
import 'package:car_rent_app/domain/repositories/car_repository.dart';

class GetCarUsecase {
  final CarRepository repository;

  GetCarUsecase({required this.repository});

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
