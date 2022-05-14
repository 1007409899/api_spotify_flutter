import 'package:api_spotify_flutter/models/viewmodel.dart';
import 'package:api_spotify_flutter/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ViewModelApi(),
        child: MaterialApp(
          title: 'Flutter Example',
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: AppRoutes().getRoutes,
        ));
  }
}
