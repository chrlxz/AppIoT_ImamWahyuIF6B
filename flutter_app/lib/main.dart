import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IoT Device Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const DeviceInfoPage(),
    );
  }
}

class DeviceInfoPage extends StatelessWidget {
  const DeviceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Perangkat'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.lightbulb, size: 80, color: Colors.amber),
                const SizedBox(height: 20),
                const Text('📌 Perangkat: Smart Lamp',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('✅ Status: Online',
                    style: TextStyle(fontSize: 16, color: Colors.green)),
                const Text('📌 IP Address: 192.168.255.250',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeviceControlPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Buka Kontrol',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeviceControlPage extends StatefulWidget {
  const DeviceControlPage({super.key});

  @override
  DeviceControlPageState createState() => DeviceControlPageState();
}

class DeviceControlPageState extends State<DeviceControlPage> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontrol Perangkat'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.lightbulb, size: 80, color: Colors.amber),
                const SizedBox(height: 20),
                const Text('💡 Smart Lamp',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  isOn ? '✅ Status: Menyala' : '❌ Status: Mati',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isOn ? Colors.green : Colors.red),
                ),
                const SizedBox(height: 20),
                Switch(
                  value: isOn,
                  activeColor: Colors.blueAccent,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
