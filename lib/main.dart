import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(8.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  late final AnimationController _stayController =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat(reverse: true);

  late final Animation<Offset> _offsetStayAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.0, -3.0),
  ).animate(CurvedAnimation(
    parent: _stayController,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Game'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SlideTransition(
                  position: _offsetAnimation,
                  child: Image(
                    height: 50,
                    width: 50,
                    image: AssetImage('stone.png'),
                  ),
                ),
              ],
            ),
            SlideTransition(
              position: _offsetStayAnimation,
              child:
                  Image(height: 75, width: 75, image: AssetImage('stay.png')),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('JUMP'),
            ),
          ],
        ),
      ),
    );
  }
}
