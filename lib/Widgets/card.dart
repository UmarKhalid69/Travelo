import 'package:flutter/material.dart';
import 'package:travel_app_se/details.dart';

class CardTile extends StatefulWidget {
  const CardTile({super.key, required String title, required AssetImage image});

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  var skurdu1 = const AssetImage('assets/Skurdu1.png');
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: Column(
        children: [
          Image(image: skurdu1),
          const ListTile(
            title: Text('Murree', style: TextStyle(fontSize: 28)),
            subtitle: Text('Pakistan', style: TextStyle(fontSize: 12)),
            // trailing:
            //     TextButton(onPressed: () {}, child: const Text('Book Now')),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Text("Estimated Rs: 10,000 - 25,000 PKR"),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {}, child: const Text('Book Now')),
              TextButton(
                onPressed: () { 
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()),
                );
                },
                child: const Text('Details'),
              )
            ],
          )
        ],
      )),
    );
  }
}

class MyCustomCard extends StatelessWidget {
  final String title;
  final Image image;

  const MyCustomCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

cardtile(title, image, subtitle, String text) {
  return Card(
      child: Column(
    children: [
      Image(image: image),
      ListTile(
        title: Text(title, style: const TextStyle(fontSize: 28)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        // trailing:
        //     TextButton(onPressed: () {}, child: const Text('Book Now')),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          Text(text),
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () {}, child: const Text('Book Now')),
          TextButton(
              onPressed: () {
                
              },
              child: const Text('Details')),
        ],
      )
    ],
  ));
}

detailCard(title, image, subtitle, String text) {
  return Card(
    child: Column(
      children: [
        Image(image: image),
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 28)),
          subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
          // trailing:
          //     TextButton(onPressed: () {}, child: const Text('Book Now')),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 18,
            ),
            Expanded(
                child: Text(
              text,
              textAlign: TextAlign.start,
            )),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: 360,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Text('Book Now'),
          ),
        ),
      ],
    ),
  );
}
