import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../commons/Constants.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          const Text("Scegli il numero di squadre:"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              //Navigator.of(context).pushNamed('/draw');
            },
            child: const Text("Avanti",style: TextStyle(
                color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal),
            ),
          )
        ],
      )
  );

  }
  
  
}