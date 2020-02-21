import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidosapp_v1/src/login/bloc/login_bloc.dart';

//Custom imports
import 'package:pedidosapp_v1/src/pages/home_page.dart';

import 'package:pedidosapp_v1/src/pages/splash_screen_page.dart';

import 'package:pedidosapp_v1/src/login/login_screen.dart';
import 'package:pedidosapp_v1/src/repository/user_repository.dart';
import 'package:pedidosapp_v1/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:pedidosapp_v1/src/blocs/simple_bloc_delegate.dart';
//import 'package:pedidosapp_v1/src/pages/test_firebase.dart';
//import 'package:pedidosapp_v1/src/blocs/login_bloc/login_logic.dart';
//import 'package:pedidosapp_v1/src/blocs/login_bloc/login_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    //runApp(MyApp());
    runApp(BlocProvider(
      create: (BuildContext context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: MyApp(userRepository: userRepository),
    ));
  });
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  const MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }

          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }

          if (state is Authenticated) {
            return HomePage();
          }
        },
      ),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          //splashColor: Colors.pink,
          fontFamily: 'Dosis'),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Pedidos Ale',
  //     initialRoute: 'login',
  //     routes: {
  //       'login': (BuildContext context) =>
  //           BlocBuilder<AuthenticationBloc, AuthenticationState>(
  //             builder: (context, state) {
  //               return Container();
  //             },
  //           ),
  //       'home': (BuildContext context) => HomePage(),
  //       'messages': (BuildContext context) => MessagesPage(),
  //       'pedido_detail': (BuildContext context) => PedidoDetail(),
  //       //'firetest': (BuildContext context) => TestPage()
  //     },
  //     theme: ThemeData(
  //         primarySwatch: Colors.pink,
  //         //splashColor: Colors.pink,
  //         fontFamily: 'Dosis'),
  //   );

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Pedidos Ale',
  //     initialRoute: 'login',
  //     routes: {
  //       'login': (BuildContext context) => BlocProvider(
  //             child: LoginPage(),
  //             create: (_) => LoginBloc(logic: SimpleLoginlogic()),
  //           ),
  //       'home': (BuildContext context) => HomePage(),
  //       'messages': (BuildContext context) => MessagesPage(),
  //       'pedido_detail': (BuildContext context) => PedidoDetail(),
  //       'firetest': (BuildContext context) => TestPage()
  //     },
  //     theme: ThemeData(
  //         primarySwatch: Colors.pink,
  //         //splashColor: Colors.pink,
  //         fontFamily: 'Dosis'),
  //   );
  // }

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
