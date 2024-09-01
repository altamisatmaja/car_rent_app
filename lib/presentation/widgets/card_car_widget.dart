part of 'widget.dart';

class CardCarWidget extends StatelessWidget {
  final Car car;
  const CardCarWidget({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(
              car: Car(
                  distance: car.distance,
                  fuelCapacity: car.fuelCapacity,
                  model: car.model,
                  pricePerHour: car.pricePerHour),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 12, spreadRadius: 5)
            ]),
        child: Column(
          children: [
            Image.asset(
              'assets/car_image.png',
              height: 120.0,
            ),
            Text(
              car.model,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        Text('${car.distance.toStringAsFixed(0)} Km')
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        Text('${car.fuelCapacity.toStringAsFixed(0)} L')
                      ],
                    )
                  ],
                ),
                Text(
                  'Rp ${car.pricePerHour.toStringAsFixed(3)} / jam',
                  style: const TextStyle(fontSize: 16.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
