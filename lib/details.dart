import 'package:flutter/material.dart';
import 'package:travel_app_se/Widgets/card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

String murree =
    'Murree is a popular hill station located in the Pir Panjal range within the Rawalpindi District of Punjab, Pakistan. Nestled at an elevation of around 2,291 meters (7,516 feet) above sea level, Murree is renowned for its picturesque landscapes, lush green hills, and pleasant weather. It serves as a favored destination for tourists, particularly during the summer months when people seek refuge from the heat in the plains.';
String islamabad =
    'Islamabad is the capital city of Pakistan, situated at the northern edge of the country, near the Margalla Hills National Park. It was officially designated as the capital in 1963, replacing Karachi. Islamabad is known for its modern infrastructure, organized layout, and scenic beauty. The city is characterized by wide, tree-lined avenues, green spaces, and a well-planned urban design.';
String skurdu =
    "Skardu is situated along the Indus River and is known for its breathtaking scenery, including picturesque valleys, serene lakes, and snow-capped peaks. The town is a gateway to some of the most renowned trekking and mountaineering destinations in the region, such as the famous Baltoro Glacier, K2 Base Camp, and Concordia.";

String swat =
    "Swat is a picturesque valley located in the Khyber Pakhtunkhwa province of Pakistan. Often referred to as the Switzerland of Pakistan, Swat is renowned for its stunning natural beauty, lush green valleys, meandering rivers, and snow-capped mountains. The valley has a rich cultural and historical heritage, with archaeological sites dating back to the Gandhara civilization.The Swat Valley has been a popular tourist destination for its pleasant climate, scenic landscapes, and cultural attractions. Mingora, the largest city in Swat, serves as the commercial and administrative center. Malam Jabba, a hill station in Swat, is known for its ski resorts and is a popular destination for winter sports enthusiasts.";

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          centerTitle: true,
        ),
        body: Card(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/Murree1.png'),
              ),
              const ListTile(
                title: Text('Murree', style: TextStyle(fontSize: 28)),
                subtitle: Text('Pakistan', style: TextStyle(fontSize: 12)),
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
                    murree,
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
        ));
  }
}
