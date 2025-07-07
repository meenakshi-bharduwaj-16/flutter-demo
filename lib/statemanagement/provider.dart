
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notify widgets to rebuild
  }
}

class ProviderCounterPage extends StatelessWidget {
  const ProviderCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
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
                    child: Text(
                      '${counter.count}',
                      style: TextStyle(color: Colors.black, fontSize: 18)
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
                      counter.increment(); // Increment the counter when button is pressed
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
                      child: Text('Login',
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


