import 'package:flutter/material.dart';
import 'gases.dart';

// ignore: non_constant_identifier_names
Widget OutOut(int noble_state) {
  return DefaultTabController(
    length: noble_gases.length,
    initialIndex: noble_state,
    child: Builder(
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabPageSelector(),
            Expanded(
              child: TabBarView(children: gasOut),
            ),
          ],
        ),
      ),
    ),
  );
}

// class nobleChart extends StatelessWidget {
//   nobleChart({Key key, this.noble_state}) : super(key: key);
//   int noble_state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[800],
//       drawer: Drawer(
//         elevation: 20.0,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.grey[850],
//               ),
//               child: Text(
//                 'The Noble Gases',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 28.0,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'GreatPrimer',
//                 ),
//               ),
//             ),
//             // SizedBox(height: 30.0),
//             Card(
//               // color: Colors.grey[850],
//               child: ListTile(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => stppage())
//                   );
//                 },
//                 leading: Icon(
//                   Icons.home,
//                 ),
//                 title: Text(
//                   'Home',
//                   style: TextStyle(
//                     // color: Colors.white54,
//                     letterSpacing: 2.0,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: 'Courgette',
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               // color: Colors.grey[850],
//               child: ListTile(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) => AlertDialog(
//                       title: const Text(
//                         'About Developer',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 32.0,
//                         ),
//                       ),
//                       content: const Text(
//                           '''Hi this is Milan Gurung, the Developer of this Noble Gases app. This App only contains 6 Noble gases, the reason I didn't include Oganesson-118 because very few information and no pictures whatsoever. This Project was Assigned by our Great Mentor Mr. Susan Timilsina Dai.\nThank you for Checking out my App!'''
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: Text('Close'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 leading: Icon(
//                   Icons.info_rounded,
//                 ),
//                 title: Text(
//                   'About Developer',
//                   style: TextStyle(
//                     // color: Colors.white54,
//                     letterSpacing: 2.0,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: 'Courgette',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//
//         ),
//       ),
//       appBar: AppBar(
//         title: Text(
//           'The Noble Gases',
//           style: TextStyle(
//             fontFamily: 'GreatPrimer',
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.grey[850],
//         elevation: 0.0,
//       ),
//       body: DefaultTabController(
//         length: noble_gases.length,
//         initialIndex: noble_state,
//         child: Builder(
//           builder: (BuildContext context) => Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 TabPageSelector(),
//                 Expanded(
//                   child: TabBarView(
//                       children:
//                       gasOut
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
