import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Bookings').snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('No Bookings');
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot bookings = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text(bookings['username']),
                  subtitle: Text(bookings['useremail']),
                  trailing: Text(bookings['tickets'].toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
