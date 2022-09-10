import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Image(
                image: AssetImage("assets/images/water_leaf.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Center(
                    child: Text(
                  "HYDRATER",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                )),
                Center(child: Text("Your Health is Our Responsibility"))
              ],
            ),
          ),
          IconButton(
              iconSize: 46,
              style: ElevatedButton.styleFrom(
                shadowColor: Theme.of(context).primaryColorDark,
                elevation: 8,
                // backgroundColor: Theme.of(context).backgroundColor
              ),
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_sharp,
                color: Theme.of(context).primaryColorDark,
              )),
          SizedBox(
            height: 35,
          )
        ]),
      ),
    );
  }
}
