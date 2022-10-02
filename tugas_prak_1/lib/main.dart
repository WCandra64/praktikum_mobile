import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Screen',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    Widget _pageTitle() {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(10,160,10,40),
        child: Image.asset('images/flutter.png', width: 20)
      );
    }

    Widget _emailField() {
      return Container(
        padding: EdgeInsets.fromLTRB(40,0,40,10),
        child: TextFormField(
          enabled: true,
          style: TextStyle(color: Color(0xffF4F7FB)),
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Color(0xffa9b9cf)),
            hintText: 'example@exmail.com',
            hintStyle: TextStyle(color: Color(0xffa9b9cf)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                borderSide: BorderSide(color: Color(0xffa9b9cf))
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                borderSide: BorderSide(color: Color(0xffF4F7FB))
            ),
          ),
        ),
      );
    }

    Widget _passwordField() {
      return Container(
        padding: EdgeInsets.fromLTRB(40,0,40,0),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          style: TextStyle(color: Color(0xffF4F7FB)),
          decoration: const InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Color(0xffa9b9cf)),
            hintText: '********',
            hintStyle: TextStyle(color: Color(0xffa9b9cf)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                borderSide: BorderSide(color: Color(0xffa9b9cf))
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                borderSide: BorderSide(color: Color(0xffF4F7FB), width: 2.0)
            ),
          ),
        ),
      );
    }

    Widget _loginButton() {
      return Container(
        padding: EdgeInsets.fromLTRB(40, 25, 40, 0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Log In', style: TextStyle(color: Color(0xffF4F7FB)),),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15),
            primary: Color(0xff475E80)
          ),
        ),
      );
    }

    Widget _forgotButton() {
      return Container(
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: Color(0xffF4F7FB))
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff34495e),
        appBar: AppBar(
          title: Text("Login Screen"),
          backgroundColor: Color(0xff475E80),
        ),
        body: Column(
          children: [
            _pageTitle(),
            _emailField(),
            _passwordField(),
            _loginButton(),
            _forgotButton(),
          ]
        ),
      ),
    );
  }
}
