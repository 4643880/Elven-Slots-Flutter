// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async';

// import 'package:flutter_slot_machine/slot_machine.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late SlotMachineController _controller;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void onButtonTap({required int index}) {
//     _controller.stop(reelIndex: index);
//   }

//   void onStart() {
//     final index = Random().nextInt(20);
//     _controller.start(hitRollItemIndex: index < 5 ? index : null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SlotMachine(
//               rollItems: [
//                 // RollItem(index: 0, child: Icon(Icons.access_alarm)),
//                 // RollItem(index: 1, child: Icon(Icons.access_alarm)),
//                 // RollItem(index: 2, child: Icon(Icons.access_alarm)),
//                 // RollItem(index: 3, child: Icon(Icons.access_alarm)),
//                 // RollItem(index: 4, child: Icon(Icons.access_alarm)),
//                 RollItem(
//                     index: 0, child: Image.asset('assets/images/item2.png')),
//                 RollItem(
//                     index: 1, child: Image.asset('assets/images/item2.png')),
//                 RollItem(
//                     index: 2, child: Image.asset('assets/images/item6.png')),
//                 RollItem(
//                     index: 3, child: Image.asset('assets/images/item4.png')),
//                 RollItem(
//                     index: 4, child: Image.asset('assets/images/item5.png')),
//               ],
//               onCreated: (controller) {
//                 _controller = controller;
//               },
//               onFinished: (resultIndexes) {
//                 print('Result: $resultIndexes');
//               },
//             ),

         
//             Padding(
//               padding: const EdgeInsets.only(top: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 72,
//                     height: 44,
//                     child: TextButton(
//                         child: Text('STOP'),
//                         onPressed: () => onButtonTap(index: 0)),
//                   ),
//                   SizedBox(width: 8),
//                   SizedBox(
//                     width: 72,
//                     height: 44,
//                     child: TextButton(
//                         child: Text('STOP'),
//                         onPressed: () => onButtonTap(index: 1)),
//                   ),
//                   SizedBox(width: 8),
//                   SizedBox(
//                     width: 72,
//                     height: 44,
//                     child: TextButton(
//                         child: Text('STOP'),
//                         onPressed: () => onButtonTap(index: 2)),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 24),
//               child: TextButton(
//                 child: Text('START'),
//                 onPressed: () => onStart(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
