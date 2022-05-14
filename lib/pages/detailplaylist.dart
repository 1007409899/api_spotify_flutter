import 'package:api_spotify_flutter/models/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screen = MediaQuery.of(context).size.height;

    return Consumer<ViewModelApi>(builder: (context, dataimc, child) {
      return Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screen / 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 33, 50, 63),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 105.0,
                  ),
                  Text(
                    dataimc.GetNameAlbum + "  " + ".",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screen / 1.9,
            left: 80,
            right: 80,
            height: 200,
            child: Hero(
              tag: dataimc.getId,
              child: Container(
                width: 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(dataimc.GetImages),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 670,
            left: 60,
            right: 60,
            height: 200,
            child: Container(
              child: Column(
                children: [
                  Text(
                    dataimc.GetName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    dataimc.GetNameAlbum,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0:00",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        (((dataimc.getDuration_ms) / 1000 / 60)
                                    .toStringAsFixed(1))
                                .toString() +
                            "0" +
                            ": 00",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.play_circle,
                        color: Color.fromARGB(255, 202, 150, 5),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Slider(
                        min: 0.0,
                        max: 1.0,
                        value: 0.0,
                        activeColor: Color.fromARGB(255, 202, 150, 5),
                        inactiveColor: Color.fromARGB(255, 197, 197, 197),
                        onChanged: (double value) {},
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
        ],
      ));
    });
  }
}
