// import 'package:flutter/material.dart';
//
//
// class DetailedList extends StatelessWidget {
//   const DetailedList({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leader Board'),
//         backgroundColor: const Color(0xff463F71),
//       ),
//       body: FutureBuilder(
//         future: fetchName(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('No data available'));
//           }
//
//           final contactList = snapshot.data as List<RoomName>;
//
//           return ListView.builder(
//             itemCount: contactList.length,
//             itemBuilder: (context, index) {
//               final contact = contactList[index];
//
//               return InkWell(
//                 onTap: () {
//                   // Navigate to the detailed screen passing the contact details
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailScreen(contact: contact),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Text(
//                     contact.name,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DetailScreen extends StatelessWidget {
//   final RoomName contact;
//
//   const DetailScreen({Key? key, required this.contact});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Text(
//             contact.name,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         backgroundColor: const Color(0xff463F71),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildDetailText('ID: ${contact.id}', 18, Colors.black),
//             SizedBox(height: 8),
//             buildDetailText('Price: ${contact.price}', 18, Colors.black),
//             SizedBox(height: 8),
//             buildDetailText('Rating: ${contact.rating}', 18, Colors.black),
//             SizedBox(height: 8),
//             buildDetailText('Image: ${contact.image}', 18, Colors.black),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Text buildDetailText(String text, double size, Color color) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: size,
//         color: color,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
