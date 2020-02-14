import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Custom imports
//import 'package:pedidosapp_v1/src/bloc/provider.dart';

import 'package:pedidosapp_v1/src/pages/home_page.dart';
import 'package:pedidosapp_v1/src/pages/login_page.dart';
import 'package:pedidosapp_v1/src/pages/messages_page.dart';
import 'package:pedidosapp_v1/src/pages/pedido_detail_page.dart';
import 'package:pedidosapp_v1/src/pages/test_firebase.dart';
import 'package:pedidosapp_v1/src/blocs/login_bloc/login_logic.dart';
import 'package:pedidosapp_v1/src/blocs/login_bloc/login_bloc.dart';

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
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => BlocProvider(
              child: LoginPage(),
              create: (_) => LoginBloc(
                logic: SimpleLoginlogic()
              ),
            ),
        'home': (BuildContext context) => HomePage(),
        'messages': (BuildContext context) => MessagesPage(),
        'pedido_detail': (BuildContext context) => PedidoDetail(),
        'firetest': (BuildContext context) => TestPage()
      },
      theme: ThemeData(
          primarySwatch: Colors.pink,
          //splashColor: Colors.pink,
          fontFamily: 'Dosis'),
    );
  }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Pedidos Ale',
//         initialRoute: 'firetest',
//         routes: {
//           'login': (BuildContext context) => BlocProvider(child: LoginPage(), create: (BuildContext context) => LoginB.LoginBloc()),
//           'home': (BuildContext context) => HomePage(),
//           'messages': (BuildContext context) => MessagesPage(),
//           'pedido_detail': (BuildContext context) => PedidoDetail(),
//           'firetest' : (BuildContext context) => TestPage()
//         },
//         theme: ThemeData(
//             primarySwatch: Colors.pink,
//             //splashColor: Colors.pink,
//             fontFamily: 'Dosis'),
//       ),
//     );
//   }
}
