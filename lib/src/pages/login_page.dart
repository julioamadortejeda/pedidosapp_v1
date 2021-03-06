// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pedidosapp_v1/src/blocs/login_bloc/login_bloc.dart';

// //import 'package:pedidosapp_v1/src/bloc/provider.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   LoginBloc _bloc;
//   TextEditingController _emailController;
//   TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();

//     _bloc = BlocProvider.of<LoginBloc>(context);
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     _emailController.addListener(_onEmailChanged);
//     _passwordController.addListener(_onPasswordChanged);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: <Widget>[
//         _renderBackground(context),
//         _renderLoginForm(context),
//       ],
//     ));
//   }

//   Widget _renderBackground(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final backPink = Container(
//       height: size.height * 0.4,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: <Color>[
//             Color.fromRGBO(249, 83, 148, 1.0),
//             Color.fromRGBO(200, 29, 115, 1.0)
//           ])),
//     );

//     final circle = Container(
//         height: size.height * 0.4 * 0.3,
//         width: size.height * 0.4 * 0.3,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100.0),
//             color: Color.fromRGBO(255, 255, 255, 0.08)));

//     return Stack(
//       children: <Widget>[
//         backPink,
//         Positioned(top: 90.0, left: 30.0, child: circle),
//         Positioned(top: -40.0, right: -30.0, child: circle),
//         Positioned(bottom: -50.0, right: -10.0, child: circle),
//         Positioned(bottom: 120.0, right: 20.0, child: circle),
//         Positioned(bottom: -50.0, left: -20.0, child: circle),
//         Container(
//           padding: EdgeInsets.only(top: 80.0),
//           child: Column(
//             children: <Widget>[
//               Icon(Icons.shopping_cart, color: Colors.white, size: 100.0),
//               SizedBox(
//                 height: 10.0,
//                 width: double.infinity,
//               ),
//               Text(
//                 'Pedidos Shein',
//                 style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _renderLoginForm(BuildContext context) {
//     //final bloc = Provider.of(context);
//     final size = MediaQuery.of(context).size;

//     return SingleChildScrollView(
//         child: Column(
//       children: <Widget>[
//         SafeArea(
//           child: Container(height: size.height * 0.3),
//         ),
//         Container(
//           width: size.width * 0.85,
//           padding: EdgeInsets.symmetric(vertical: 50.0),
//           margin: EdgeInsets.symmetric(vertical: 10.0),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5.0),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 3.0,
//                     offset: Offset(0.0, 3.0),
//                     spreadRadius: 2.0)
//               ]),
//           child: BlocListener<LoginBloc, BasicLoginState>(
//             listener: (context, state) => _processLoginResponse(context, state),
//             child: BlocBuilder<LoginBloc, BasicLoginState>(
//                 builder: (BuildContext context, BasicLoginState state) {
//                   if(state is ErrorLoginState)
//                     {
//                       print('errror');
//                     }
//               return Column(
//                 children: <Widget>[
//                   Text(
//                     'Iniciar Sesion',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   SizedBox(
//                     height: 40.0,
//                   ),
//                   _createEmail(context),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   _createPassword(context),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   if (state.isLoggedInProcess)
//                     CircularProgressIndicator()
//                   else
//                     _createButtonLogin(context),
//                 ],
//               );
//             }),
//           ),
//         ),
//         Text('¿Olvido la contraseña?'),
//         SizedBox(
//           height: 50.0,
//         )
//       ],
//     ));
//   }

//   Widget _createEmail(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: TextField(
//         controller: _emailController,
//         keyboardType: TextInputType.emailAddress,
//         decoration: InputDecoration(
//           icon: Icon(
//             Icons.alternate_email,
//             color: Colors.pink,
//           ),
//           hintText: 'ejemplo@correo.com',
//           labelText: 'Correo electrónico',
//           counterText: _emailController.text,
//           errorText:  _bloc.state.isEmailValid ? null : 'Email no valido.',
//         ),
//         onChanged: (value) => { _bloc.add(EmailChanged(email: value))},
        
//       ),
//     );
//   }

//   Widget _createPassword(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: TextField(
//         controller: _passwordController,
//         obscureText: true,
//         keyboardType: TextInputType.emailAddress,
//         decoration: InputDecoration(
//           icon: Icon(Icons.lock_open, color: Colors.pink),
//           labelText: 'Contraseña',
//           counterText: _passwordController.text,
//           errorText: _bloc.state.isPasswordValid ? null : 'Más de 6 caracteres. '
//         ),
//         onChanged: (value) => _bloc.add(PasswordChanged(password: value)),
//       ),
//     );
//   }

//   Widget _createButtonLogin(BuildContext context) {
//     return RaisedButton(
//       onPressed: () => _login(context),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//       elevation: 0.0,
//       color: Colors.pink,
//       textColor: Colors.white,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
//         child: Text('Iniciar'),
//       ),
//     );
//   }

//   _login(BuildContext context) {
//     _bloc.add(DoLoginEvent(_emailController.text, _passwordController.text));
//   }

//   void _showError(BuildContext context, String message) {
//     Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }

//   void _processLoginResponse(BuildContext context, BasicLoginState state) {
//     if (state is ErrorLoginState) {
//       _showError(context, state.message);
//       return;
//     }

//     if (!state.isEmailValid || !state.isPasswordValid) {
//       return;
//     }

//     if (state.token != '') {
//       FocusScope.of(context).requestFocus(
//           FocusNode()); // previene que el teclado se quede abierto y muestre error de overflow pixels
//       Navigator.of(context).pushReplacementNamed('home');
//     }
//   }

//   void _onEmailChanged() {
//     _bloc.add(EmailChanged(email: _emailController.text));
//   }

//   void _onPasswordChanged() {
//     _bloc.add(PasswordChanged(password: _passwordController.text));
//   }
// }
