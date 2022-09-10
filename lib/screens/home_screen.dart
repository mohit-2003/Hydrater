import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hydrater/utils/geolocator.dart';
import 'package:hydrater/utils/weather.dart';
import 'package:weather/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? temp;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hydrater"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          temp != null ? Text(temp) : const Text("Your Temperature "),
          ElevatedButton(
              onPressed: () async {
                final val = await MyWeather().getTemperature();

                setState(() {
                  temp = val.toString();
                  debugPrint("AfterPress: $temp");
                });
              },
              child: const Text("Press me"))
        ],
      ),
    );
  }
}
