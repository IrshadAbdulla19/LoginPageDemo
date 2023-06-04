import 'package:flutter/material.dart';
import 'package:login_page_1/main.dart';
import 'package:login_page_1/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textUsername = TextEditingController();

  final _textPassword = TextEditingController();

  final _usernam = 'irshad';

  final _password = 'Irshad23';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(106, 180, 212, 238),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Username',
                  ),
                  controller: _textUsername,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'The user name is emty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    filled: true,
                    fillColor: Color.fromARGB(106, 180, 212, 238),
                    hintText: 'password',
                  ),
                  controller: _textPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'the password is emtey';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('error');
                      }

                      // saveValue();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (cntx) {
                      //   return HomePage();
                      // }));
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: const Text(
                      'Login',
                      style: TextStyle(),
                    ),
                  ),
                  Text('click here'),
                ])
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<void> checkLogin(BuildContext cnt) async {
    if (_textPassword.text == _password && _textUsername.text == _usernam) {
      final shareprf = await SharedPreferences.getInstance();
      await shareprf.setBool(userlogin, true);
      Navigator.of(cnt).pushReplacement(MaterialPageRoute(builder: (cntx) {
        return HomePage();
      }));
    } else {
      showDialog(
          context: cnt,
          builder: (cntx) {
            return AlertDialog(
              title: const Text('error'),
              content: const Text('username and password not match'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(cntx).pop();
                    },
                    child: Text('close'))
              ],
            );
          });
    }
  }
}
