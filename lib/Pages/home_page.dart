import 'dart:convert';

import 'package:flutter/material.dart';

import '../modeclasses/gps_Data_model.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final busNumber = TextEditingController();

  List<GpsData> gpsDataList = [];

  Future<List<GpsData>?> fetchData(String busNo) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://traccar-api.apnibus.com/api/positions/byBusNumber/$busNo',
        ),
        headers: {
          "Authorization": 'Basic ${base64Encode(utf8.encode('admin:admin'))}',
        },
      );

      final List<dynamic> jsonData  = json.decode(response.body);
      gpsDataList = jsonData.map((item) => GpsData.fromJson(item)).toList();
      print(gpsDataList);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: busNumber,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      fetchData(busNumber.text);
                    },
                    child: Text("Go"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: gpsDataList.isEmpty
                  ? Center(child: Text('No data available'))
                  : ListView.builder(
                      itemCount: gpsDataList.length,
                      itemBuilder: (context, index) {
                        GpsData data = gpsDataList[index];
                        return ListTile(
                          title: Text('Bus Number: ${data.id}'),
                          subtitle: Text('Speed: ${data.speed}'),
                          // Add more information as needed
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
