import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdp_project/models/flights.dart';

Future getFlights() async {
  print("Get Flight data called!!!");
  List<dynamic> temp = [];

  try {
    await FirebaseFirestore.instance
        .collection('flights')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print( "Username : " + doc["username"]);
        temp.add(doc.data());
        // print(doc.data());
      });
    }

    );
    print(temp);
    print("From Flight  Service");
    return temp;
  }
  catch(Exception){
    return null;
  }
}