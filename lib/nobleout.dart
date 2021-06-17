import 'package:flutter/material.dart';

// ignore: camel_case_types
class nobleData extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const nobleData({Key key, this.noble_gases, this.noble_state})
      : super(key: key);
  // ignore: non_constant_identifier_names
  final List noble_gases;
  // ignore: non_constant_identifier_names
  final int noble_state;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[700],
      margin: EdgeInsets.fromLTRB(11.0, 16.0, 11.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage('images/${noble_gases[noble_state].tblink}'),
          ),
          SizedBox(height: 30.0),
          Row(
            children: [
              Text(
                'Name:',
                style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 80.0),
              Text(
                noble_gases[noble_state].element,
                style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'Symbol: ${noble_gases[noble_state].sym}',
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Atomic Number: ${noble_gases[noble_state].atno.toString()}',
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Atomic Weight: ${noble_gases[noble_state].atwt.toString()} u',
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Electronic Configuration: ',
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            noble_gases[noble_state].econfig,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[350],
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
