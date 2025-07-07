import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/statemanagement/bloc.dart';
import 'package:flutter_demo/statemanagement/provider.dart';
import 'package:flutter_demo/statemanagement/riverpod.dart';
import 'package:flutter_demo/statemanagement/set_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

void main() {
  /*runApp(
      ChangeNotifierProvider(
        create: (_) => Counter(),
        child: MyApp(),
      )
  );*/
  runApp(
    // ProviderScope makes Riverpod work
    ProviderScope(child: MyApp()),
  );

  /*runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) => /*CounterBloc*/PrintBloc(),
    child: BlocCounterScreen(),
    ),//RiverpodCounterScreen()//ProviderCounterPage()//const MyHomePage(title: '')//SetStateCounterPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  final TextEditingController textController = TextEditingController();

  void _updateButtonText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade700,
      /*appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150),
            Text('LOGIN',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            Text(
              'TO CONTINUE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40), // rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.purpleAccent.shade700,
                    size: 30,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'someone@gmail.com',
                          border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      controller: textController,
                      onChanged: (value) {
                        _updateButtonText(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 250),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                width: double.infinity,
                child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // <-- Rounded corners
                ),
                backgroundColor: Colors.blue, // button color
              ),
              child:
              Padding(
                padding: EdgeInsets.all(16), // 16 pixels on all sides
                child: Text(text.isEmpty ? 'LOGIN' : text,
                    textAlign: TextAlign.center,
                    //textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            )
                )
            )
          ],
        ),
      ),
    );
  }
}
