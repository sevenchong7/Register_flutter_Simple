import 'dart:math';
// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Georgia',
        //text style
        textTheme: const TextTheme(
            // headlineLarge:
            //     TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            // headlineMedium:
            //     TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            // headlineSmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            // bodyLarge: TextStyle(fontSize: 50, fontStyle: FontStyle.normal),
            // bodyMedium: TextStyle(fontSize: 18)
            ),

        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "item 1",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Page1(),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "item 2 ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Page2(),
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page1"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text("Back"))
        ],
      )),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  static const userList = [
    {"username": "Mobile", "password": "123123aA"},
    {"username": "Mobile2", "password": "HelloWorld"}
  ];

  var OTP_View = "";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    randomOtp(4);
  }

  void randomOtp(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    setState(() {
      OTP_View =
          List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
    });
  }

  void checkUser() {
    if (otpController.text == OTP_View) {
      if (userList.any((user) =>
          user["username"] == usernameController.text &&
          user["password"] == passwordController.text)) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Page1(),
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text("Invalid Username or Password"),
                  content: const Text(
                      "Please Enter the correct Username or Password"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text("Wrong OTP"),
                content: const Text("Please Re-enter the OTP again"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
      randomOtp(4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page2"),
        ),
        body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_login.jpg"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                // Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                const SizedBox(
                  height: 100,
                ),
                const Image(
                  image: AssetImage("assets/icon_login_logo.png"),
                  width: 300,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: TextField(
                    controller: usernameController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                      hintText: 'Enter a Username',
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                      ),
                      hintText: 'Enter a Password',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 50),
                        child: TextField(
                          controller: otpController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            prefixIcon: Icon(
                              Icons.access_time,
                              size: 20,
                            ),
                            hintText: "OTP",
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 50),
                          child: ElevatedButton(
                            onPressed: () {
                              randomOtp(4);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[600],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: const Size(150, 55)),
                            child: Text(
                              OTP_View,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 4.5,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    checkUser();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(235, 255, 255, 255),
                      side: const BorderSide(color: Colors.black87),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50)),
                  child: const Text("Submit"),
                )
              ],
            )));
  }
}
