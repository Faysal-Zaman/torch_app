import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TorchController();
  bool snapshotData = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Torch App',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Torch App'),
        //   centerTitle: true,
        //   elevation: 10,
        // ),
        body: Container(
          color: snapshotData == true ? Colors.black : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<bool?>(
                future: controller.isTorchActive,
                builder: (_, snapshot) {
                  snapshotData = snapshot.data ?? false;
                  return Container();
                },
              ),
              IconButton(
                icon: snapshotData == true
                    
                    ? const Icon(Icons.flash_off)
                    : const Icon(Icons.flash_on),
                onPressed: () {
                  controller.toggle(intensity: 1);
                  setState(() {});
                },
                color: snapshotData == true ? Colors.white : Colors.black,
                iconSize: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
