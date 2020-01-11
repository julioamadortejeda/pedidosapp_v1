import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Custom imports
import 'package:pedidosapp_v1/src/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedidos Ale',
      initialRoute: 'home',
      routes: {'home': (BuildContext context) => HomePage()},
      theme: ThemeData(primarySwatch: Colors.green,
      //splashColor: Colors.green,
      fontFamily: 'Dosis'),
    );
  }
}
