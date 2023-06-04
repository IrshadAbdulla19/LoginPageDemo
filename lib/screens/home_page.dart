import 'package:flutter/material.dart';
import 'package:login_page_1/screens/login_page.dart';
import 'package:login_page_1/screens/messege_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  List<String> name = [
    'Irshad',
    'Emmanuel',
    'Sahil',
    'Maanas',
    'Akash',
    'Nishad'
  ];
  List<String> undigit = ['1', '2', '4', '2', '3', '2'];
  final time = ['8:50am', '8:52am', '8:55am', '9:00am', '9:05am', '9:10am'];
  // get index => 0;
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('WhatsApp'),
        actions: [
          IconButton(
            onPressed: () {
              logOut(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home_bachground.jpg'),
                  fit: BoxFit.cover)),
          child: ListView.builder(
            itemBuilder: (cntx, index) {
              return ListTile(
                title: Text(
                  name[index],
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                subtitle: const Text(
                  'You have a messege',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time[index],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    CircleAvatar(
                      radius: 16,
                      child: Text(undigit[index]),
                      backgroundColor: Colors.blue,
                    )
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/$index.jpg'),
                  radius: 30,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (cntx) {
                    return MessegePage(name: name[index]);
                  }));
                },
              );
            },
            // separatorBuilder: (cntx, index) {
            //   return Divider(
            //     height: 10,
            //     color: Colors.black,
            //   );
            // },
            itemCount: 6,
          )),
    );
  }

  void logOut(BuildContext cntx) async {
    showDialog(
        context: cntx,
        builder: (cnt) {
          return AlertDialog(
            title: const Text('Logout'),
            content: Text('If you want to logout'),
            actions: [
              TextButton(
                  onPressed: () async {
                    final shareprf = await SharedPreferences.getInstance();
                    await shareprf.clear();
                    Navigator.of(cntx).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (cntx) {
                      return LoginPage();
                    }), (route) => false);
                  },
                  child: Text('yes')),
              TextButton(
                  onPressed: () {
                    return Navigator.of(cntx).pop();
                  },
                  child: Text('no')),
            ],
          );
        });
  }
}
