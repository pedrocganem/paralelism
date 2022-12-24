import 'package:flutter/material.dart';
import 'package:paralelism/core/di/di.dart';
import 'package:paralelism/features/home/view/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool isLoading = false;

  final _controller = Di.instance.get<HomeController>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _readData() {
    setState(() {
      isLoading = true;
    });
    _controller.readData().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _readData,
        tooltip: 'Increment',
        child: !isLoading
            ? const Icon(Icons.add)
            : const Center(child: CircularProgressIndicator(color: Colors.white,)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
