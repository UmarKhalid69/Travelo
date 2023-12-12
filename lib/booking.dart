import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingMurreeState();
}

class _BookingMurreeState extends State<Booking> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  late String username, useremail, userphone;

  getUserName(name) {
    username = name;
  }

  getUserEmail(email) {
    useremail = email;
  }

  getUserNumber(phone) {
    userphone = phone;
  }

  createbooking() {
    print('Booking created');

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Bookings').doc(username);

    // create map
    Map<String, dynamic> bookings = {
      'username': username,
      'useremail': useremail,
      'userphone': userphone,
      'tickets': _counter,
    };

    documentReference.set(bookings).whenComplete(() {
      print('Booking for $username created');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              onChanged: (String name) {
                getUserName(name);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                hintText: 'Enter your Email',
                labelText: 'Email',
              ),
              onChanged: (String email) {
                getUserEmail(email);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                hintText: 'Enter your Phone Number',
                labelText: 'Phone Number',
              ),
              onChanged: (String phone) {
                getUserNumber(phone);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Number of Tickets: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          // counter of tickets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // counter buttons
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_counter > 1) {
                        _counter--;
                      }
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
          // counter buttons

          // Book now button
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: 360,
              child: FloatingActionButton(
                onPressed: () {
                  createbooking();
                  //pop up for confirm booking
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Booking Confirmed'),
                        content: const Text('Your booking has been confirmed'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Book Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
