import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String model = "";
  String deviceVer = "";
  String id = "";
  String brand = "";
  String display = "";
  String host = "";
  String realDevice = "";
  String fingure = "";
  String type = "";

  Future<void> device_info() async {
    final DeviceInfoPlugin deviceInfoPlusPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlusPlugin.androidInfo;
        setState(() {
          model = build.model!;
          deviceVer = build.version.sdkInt.toString();
          id = build.androidId!;
          brand = build.brand!;
          display = build.display!;
          host = build.host!;
          realDevice = build.isPhysicalDevice.toString();
          fingure = build.fingerprint!;
          type = build.type!;
        });
      } else if (Platform.isIOS) {
        var ios = await deviceInfoPlusPlugin.iosInfo;
        setState(() {
          model = ios.model!;
          deviceVer = ios.systemVersion!;
          realDevice = ios.isPhysicalDevice.toString();
        });
      }
    } on PlatformException {
      print("EXCEPTION ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Device Info",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.info),
        onPressed: () {
          device_info();
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Model is: " + model,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Device Version : " + deviceVer,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Id is: " + id,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Brand is: " + brand,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Display is: " + display,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Host is: " + host,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Real Device is: " + realDevice,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Fingure is: " + fingure,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Model is: " + model,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Type is: " + type,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
