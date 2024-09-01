part of 'screen.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text('Informasi')],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardCarWidget(
              car: Car(
                  model: 'Fortuner GR',
                  distance: 870,
                  fuelCapacity: 50,
                  pricePerHour: 45),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                spreadRadius: 5.0)
                          ]),
                      child: const Column(
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage('assets/user.png'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Altamis Atmaja',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp 400.000',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapsDetailsScreen(
                                      car: car,
                                    )));
                      },
                      child: Container(
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                              image: AssetImage('assets/maps.png'),
                              fit: BoxFit.cover),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MoreCardWidget(
                    car: Car(
                      distance: car.distance + 100,
                      fuelCapacity: car.fuelCapacity + 100,
                      model: "${car.model}-1",
                      pricePerHour: car.pricePerHour + 10,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  MoreCardWidget(
                    car: Car(
                      model: "${car.model}-2",
                      distance: car.distance + 200,
                      fuelCapacity: car.fuelCapacity + 200,
                      pricePerHour: car.pricePerHour + 20,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  MoreCardWidget(
                    car: Car(
                      model: "${car.model}-3",
                      distance: car.distance + 300,
                      fuelCapacity: car.fuelCapacity + 300,
                      pricePerHour: car.pricePerHour + 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
