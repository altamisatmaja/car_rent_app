part of 'screen.dart';

class MapsDetailsScreen extends StatelessWidget {
  final Car car;
  const MapsDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(-8.1652, 113.7164),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: carDetailsCard(
              car: Car(
                  model: car.model,
                  distance: car.distance,
                  fuelCapacity: car.fuelCapacity,
                  pricePerHour: car.pricePerHour),
            ),
          ),
          Positioned(
            bottom: 275,
            right: 10,
            child: Image.asset('assets/white_car.png'),
          ),
        ],
      ),
    );
  }
}

Widget carDetailsCard({required Car car}) {
  return SizedBox(
    height: 350.0,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.0,
                color: Colors.black45,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                car.model,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.directions_car,
                          color: Colors.white, size: 16),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${car.distance} Km',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.directions_car,
                          color: Colors.white, size: 16),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${car.fuelCapacity.toString()} L',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0.0,
          left: 0.0,
          bottom: 0.0,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fitur',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                featureIcons(),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp ${car.pricePerHour}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: const Text(
                          'Pesan',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget featureIcons() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
        featureIcon(Icons.speed, 'Akselerasi', '0 - 100 km/jam'),
        featureIcon(Icons.ac_unit, 'AC Unit', 'Temp Control'),
      ],
    );

Widget featureIcon(IconData icon, String title, String subtitle) => Container(
      width: 100.0,
      height: 100.0,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1.0)),
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
          ),
          Text(title),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
