import 'package:flutter/material.dart';

class MessegePage extends StatefulWidget {
  final String name;
  const MessegePage({super.key, required this.name});

  @override
  State<MessegePage> createState() => _MessegePageState();
}

class _MessegePageState extends State<MessegePage> {
  // final name ;
  final _messege = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text(widget.name),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                Text(_messege.text),
                TextFormField(
                  controller: _messege,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(106, 180, 212, 238),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'type somting',
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
