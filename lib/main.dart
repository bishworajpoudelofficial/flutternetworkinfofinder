import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

// Network Info Finder By Bishworaj Poudel

void main() {
  runApp(const MaterialApp(
    home: NetworkInfoScreen(),
  ));
}

class NetworkInfoScreen extends StatefulWidget {
  const NetworkInfoScreen({Key? key}) : super(key: key);

  @override
  _NetworkInfoScreenState createState() => _NetworkInfoScreenState();
}

class _NetworkInfoScreenState extends State<NetworkInfoScreen> {
  String wifiName = "N/A";
  String wifiBSSID = "N/A";
  String wifiIPv4 = "N/A";
  String wifiIPv6 = "N/A";
  String broadCast = "N/A";
  String gateway = "N/A";
  String submask = "N/A";
  final info = NetworkInfo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadInfo();
  }

  loadInfo() async {
    String awifiBSSID = (await info.getWifiBSSID())!;
    String awifiIPv4 = (await info.getWifiIPv6())!;
    String awifiIPv6 = (await info.getWifiIPv6())!;
    String abroadCast = (await info.getWifiBroadcast())!;
    String agateway = (await info.getWifiGatewayIP())!;
    setState(() {
      wifiBSSID = awifiBSSID;
      wifiIPv4 = awifiIPv4;
      wifiIPv6 = awifiIPv6;
      broadCast = abroadCast;
      gateway = agateway;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Info Finder'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Wifi BSSID'),
                  subtitle: Text(wifiBSSID),
                ),
                ListTile(
                  title: const Text('Wifi IPv4'),
                  subtitle: Text(wifiIPv4),
                ),
                ListTile(
                  title: const Text('Wifi IPv6'),
                  subtitle: Text(wifiIPv6),
                ),
                ListTile(
                  title: const Text('Broadcast'),
                  subtitle: Text(broadCast),
                ),
                ListTile(
                  title: const Text('Gateway'),
                  subtitle: Text(gateway),
                ),
                ListTile(
                  title: const Text('Submask'),
                  subtitle: Text(submask),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
