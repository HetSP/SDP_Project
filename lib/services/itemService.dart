import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bakery_project/models/item.dart';

Future getItems() async {
  print('Get item data called!!!');
  List<dynamic> temp = [];
  try{
    await FirebaseFirestore.instance
        .collection('items')
        .get()
        .then((QuerySnapshot querySnapshot){
          querySnapshot.docs.forEach((doc){
            temp.add(doc.data());
          });
    });
    print(temp);
    print("From item service");
    return temp;
  }
  catch(Excepthion){
    return null;
  }
}