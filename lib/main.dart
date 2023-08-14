import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controller/count_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    var isControllerRegistered = Get.isRegistered<CountController>();
    // final controller = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Is Controller Registered $isControllerRegistered"),
            const Text('You have pushed the button this many times:'),
            Obx(() => Text(
                  "${CountController.to.count.value}",
                  style: Theme.of(context).textTheme.headline4,
                ))
            // Obx(() => Text(
            //       "${controller.count.value}",
            //       style: Theme.of(context).textTheme.headline4,
            //     ))
            // GetBuilder<CountController>(builder: (controller) {
            //   return Text(
            //     '${controller.count}',
            //     style: Theme.of(context).textTheme.headline4,
            //   );
            // }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CountController.to.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
