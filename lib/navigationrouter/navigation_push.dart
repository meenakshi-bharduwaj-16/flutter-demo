import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _SetStateNavigationRouter createState() => _SetStateNavigationRouter();

  }
class _SetStateNavigationRouter extends State<FirstScreen> {

  String result = "No Data";

  void updateValue(String value) {
    setState((){
      result = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Second Screen: $result"),
          onPressed: () async {
            /********* NAVIGATOR PUSH METHOD ************/
            result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen(data: "Hello")),
            );
            /********* NAMED ROUTES ************/
            /*await Navigator.pushNamed(context, '/second');*/

            updateValue(result);
            print("Returned: $result");
          },
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}


class SecondScreen extends StatelessWidget {
  String data;
  SecondScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text(data),
          onPressed: () {
            Navigator.pop(context, "Hello back!");
          },
        ),
      ),
    );
  }
}