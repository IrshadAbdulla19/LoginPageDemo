import 'package:flutter/material.dart';
import 'package:login_page_1/main.dart';
import 'package:login_page_1/screens/home_page.dart';
import 'package:login_page_1/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Logincheak();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Text(
        'Welcome to My App',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      )
          // Image.network(
          //   'https://st.depositphotos.com/1029541/4649/i/600/depositphotos_46490905-stock-photo-waterproof-smartphone.jpg',
          //   height: 50,
          // ),
          ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> forDelay() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cntx) {
      return LoginPage();
    }));
  }

  Future<void> Logincheak() async {
    final sharepref = await SharedPreferences.getInstance();
    final _userLogedin = sharepref.getBool(userlogin);
    if (_userLogedin == null || _userLogedin == false) {
      forDelay();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cntx1) {
        return HomePage();
      }));
    }
  }
}
