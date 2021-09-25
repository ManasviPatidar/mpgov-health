import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> entries = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchEntries(),
      builder: (context, result) {
        if (result.hasData && result.data != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('All Entries'),
            ),
            body: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    Get.toNamed('/details', arguments: entries[index]['id']);
                  },
                  child: ListTile(
                    title: Text(entries[index]['name'] ?? ''),
                    subtitle: Text(entries[index]['phone'] ?? ''),
                  ),
                );
              },
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<bool> _fetchEntries() async {
    var collection = FirebaseFirestore.instance.collection('patient');
    var query = collection.orderBy('timeAdded', descending: true);
    var docs = (await query.get()).docs;
    entries = List.generate(
      docs.length,
      (index) {
        var map = docs[index].data();
        map.addAll({'id': docs[index].id});
        return map;
      },
    );
    return true;
  }
}
