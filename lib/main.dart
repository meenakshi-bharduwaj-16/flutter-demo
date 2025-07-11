import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/statemanagement/bloc.dart';
import 'package:flutter_demo/statemanagement/cubit.dart';
import 'package:flutter_demo/statemanagement/go_route/auth.dart';
import 'package:flutter_demo/statemanagement/go_route/screens/home_screen.dart';
import 'package:flutter_demo/statemanagement/go_route/screens/login_screen.dart';
import 'package:flutter_demo/statemanagement/go_route/screens/main_scaffold.dart' show MainScaffold;
import 'package:flutter_demo/statemanagement/go_route/screens/profile_screen.dart';
import 'package:flutter_demo/statemanagement/go_route/screens/settings_screen.dart';
import 'package:flutter_demo/statemanagement/provider.dart';
import 'package:flutter_demo/statemanagement/riverpod.dart';
import 'package:flutter_demo/statemanagement/set_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide ChangeNotifierProvider, Provider;
import 'package:provider/provider.dart';

import 'domain/usecases/increment_counter.dart';
import 'navigationrouter/navigation_push.dart';
import 'navigationrouter/on_generate_route.dart' hide ProfileScreen, HomeScreen;
import 'package:go_router/go_router.dart';

void main() {
  /*****************
   *** GO ROUTER ***
   *****************/
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: const MyAppGoRouter(),
    ),
  );
  /***********************
   *** onGenerateRoute ***
   ***********************/
  /*runApp(const MyAppOnGenerteRoute());*/
  /********************
   *** NAMED ROUTES ***
   ********************/
  /*runApp(const MyAppNamedRoutes());*/
  /***************************
   *** NAVIGATION & ROUTER ***
   ***************************/
  /*runApp(const MyAppPushNavigator());*/
  /************************
   *** STATE MANAGEMENT ***
   ************************/
  /****** SET_STATE *******/
  /*runApp(MyAppSetState());*/
  /****** PROVIDER *******/
   /*runApp(
      ChangeNotifierProvider(
        create: (_) => Counter(),
        child: MyAppProvider(),
      )
  );*/
  /****** RIVERPOD *******/
  /*runApp(
    ProviderScope(
      child: MyAppRiverpod(),
    ),
  );*/
  /****** BLOC *******/
  /*runApp(
    BlocProvider(
      create: (_) => PrintBloc(),
      child: MyAppBloc(),
    ),
  );*/
  /****** CUBIT *******/
  /*runApp(
    BlocProvider(
      create: (_) => CounterCubit(),
      child: MyAppCubit(),
    ),
  );*/
}

/************************
        Widget
 ************************/



class MyAppGoRouter extends StatelessWidget {
  const MyAppGoRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: true);

    final router = GoRouter(
      refreshListenable: auth,
      initialLocation: '/home',
      redirect: (context, state) {
        final loggedIn = auth.isLoggedIn;
        final goingToLogin = state.uri.path == '/login';

        if (!loggedIn && !goingToLogin) return '/login';
        if (loggedIn && goingToLogin) return '/home';

        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return MainScaffold(child: child);
          },
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileScreen(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => SettingsScreen(),
            ),
          ],
        ),
      ],
     /* routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _calculateIndex(state.uri.path),
                onTap: (index) {
                  switch (index) {
                    case 0:
                      context.go('/home');
                      break;
                    case 1:
                      context.go('/profile');
                      break;
                    case 2:
                      context.go('/settings');
                      break;
                  }
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileScreen(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => SettingsScreen(),
            ),
          ],
        ),
      ],*/
    );

    return MaterialApp.router(
      routerConfig: router,
      title: 'GoRouter App',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }

  int _calculateIndex(String path) {
    if (path.startsWith('/profile')) return 1;
    if (path.startsWith('/settings')) return 2;
    return 0;
  }
}

class MyAppOnGenerteRoute extends StatelessWidget {
  const MyAppOnGenerteRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On Generate Route',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        } else if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(/*userId: args['userId']*/),
          );
        }
        return null; // or handle unknown routes
      },
    );
  }
}


class MyAppNamedRoutes extends StatelessWidget {
  const MyAppNamedRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(data: "Hello from First Screen - Meenakshi Bhardwaj"),
      },
    );
  }
}


class MyAppPushNavigator extends StatelessWidget {
  const MyAppPushNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Navigator',
      home: FirstScreen(),
    );
  }
}

class MyAppSetState extends StatelessWidget {
  const MyAppSetState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SetState Counter',
      home: SetStateCounterPage(),
    );
  }
}

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Counter',
      home: ProviderCounterPage(),
    );
  }
}

class MyAppRiverpod extends StatelessWidget {
  const MyAppRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Counter',
      home: RiverpodCounterScreen(),
    );
  }
}

class MyAppBloc extends StatelessWidget {
  const MyAppBloc({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Counter',
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: BlocCounterScreen(),
      ),
    );
  }
}

class MyAppCubit extends StatelessWidget {
  const MyAppCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Counter',
      home: CubitCounterScreen(),
    );
  }
}

/************************
        Home Page
 ************************/

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
