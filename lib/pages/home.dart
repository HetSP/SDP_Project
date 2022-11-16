import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_project/models/flights.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double h = 0, w = 0;

  Stream<List<Flight>> readFlights() => FirebaseFirestore.instance.collection('flights')
      .snapshots().map((snapshot)=>
        snapshot.docs.map((doc)=> Flight.fromJson(doc.data())).toList());

  Widget buildFlight(Flight flight) =>Card(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Color.fromRGBO(202, 240, 248, 1),
    child: Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              children: [
                Image(
                  image:
                  AssetImage('assets/images/' + flight.company + '.png'),
                  height: h * 0.15,
                  width: w * 0.25,
                )
              ],
            ),
            VerticalDivider(
              thickness: 2,
              color: Colors.blueAccent,
            ),
            Column(
              children: [
                IntrinsicHeight(
                  child: Column(
                    children: [
                      Text(
                        flight.source,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        size: 40,
                        // color: Colors,
                      ),
                      Text(
                        flight.destination,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Text(
                  "Price: ₹"+ flight.eco_price,
                  // "Nothing",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
      Container(
        child: StreamBuilder<List<Flight>>(
          stream: readFlights(),
          builder: ( context, snapshot) {
            if(snapshot.hasError){
              return Text("Error occured!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
            }
            else if (snapshot.hasData) {
              final flights = snapshot.data;
              return ListView(
                children: flights!.map(buildFlight).toList(),
              );
            }
            else{
              return Center (child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
