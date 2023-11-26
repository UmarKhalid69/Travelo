import 'package:flutter/material.dart';
import 'package:travel_app_se/Widgets/Navbar.dart';
import 'package:travel_app_se/Widgets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var skurdu1 = const AssetImage('assets/Skurdu1.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.people_alt_outlined),
        ),
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: //Gridview with CardTile() called in it
          //     GridView.count(
          //   crossAxisCount: 2,
          //   children: List.generate(10, (index) {
          //     return const Column(
          //       // mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Expanded(child: CardTile()),
          //       ],
          //     );
          //   }),
          // ),

          SingleChildScrollView(
        child: Column(
          children: [
            cardtile('Skurdu', const AssetImage('assets/Skurdu1.png'),
                'Pakistan', '10,000 - 25,000 PKR'),
            cardtile('Islamabad', const AssetImage('assets/Islamabad2.png'),
                'Pakistan', '20,000 - 45,000 PKR'),
            cardtile('Murree', const AssetImage('assets/Murree1.png'),
                'Pakistan', '10,000 - 40,000 PKR'),
            cardtile('Swat', const AssetImage('assets/Swat1.png'), 'Pakistan',
                '15,000 - 34,000 PKR'),

            // CardTile(
            //   title: 'Murree',
            //   image: AssetImage('assets/Murree1.png'),
            // ),
            // CardTile(
            //   title: 'Skurdu',
            //   image: AssetImage('assets/Skurdu2.png'),
            // ),
            // CardTile(
            //   title: 'Islamabad',
            //   image: AssetImage('assets/Islamabad2.png'),
            // ),
            // CardTile(
            //   title: 'Swat',
            //   image: AssetImage('assets/swat1.png'),
            // ),
            // CardTile(
            //   title: 'Skurdu',
            //   image: AssetImage('assets/Skurdu1.png'),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
