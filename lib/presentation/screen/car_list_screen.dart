part of 'screen.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  final List<Car> car = [
    Car(
        model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(model: 'Audi', distance: 970, fuelCapacity: 45, pricePerHour: 50),
    Car(model: 'BMW', distance: 470, fuelCapacity: 30, pricePerHour: 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih mobil Anda!'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: car.length,
        itemBuilder: (context, index) {
          return CardCarWiget(
            car: car[index],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CarDetailsScreen()));
            },
          );
        },
      ),
    );
  }
}
