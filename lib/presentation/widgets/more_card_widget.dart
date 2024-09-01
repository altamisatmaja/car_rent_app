part of 'widget.dart';

class MoreCardWidget extends StatelessWidget {
  final Car car;
  const MoreCardWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: const Color(0xff212020),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: Offset(
                0,
                4,
              ),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${car.distance} Km',
                    style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${car.fuelCapacity.toString()} L',
                    style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
