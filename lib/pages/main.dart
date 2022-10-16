import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bakery_project/services/controller.dart';
import 'package:bakery_project/services/itemService.dart';
import 'package:bakery_project/models/item.dart';

class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Item> i = [
    Item('Cake', 'Chocolate', 200, ''),
    Item('Cake', 'Strawberry', 150, ''),
    Item('Pastry', 'Black Forest', 250, ''),
  ];

  List<dynamic> items = [];

  @override
  void initState(){
    super.initState();
    fetchItems();
    // print(flights);
  }

  fetchItems() async {
    List<dynamic> result = [];
    try{
      result = await getItems();
    }
    catch(Exception){
      print("Error Occured!!!!!!");
    }

    if (result.isEmpty) {
      print("Unable to fetch data");
    }
    else {
      setState() {
        items = result;
        print(items);
      }
    }
    print("Fetch flights called!!!");
  }


  Widget HomeTemplate(ticket, w, h) {
    print("Card called once");
    return Card(
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
                    AssetImage('assets/images/' + ticket.company + '.png'),
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
                    child: Row(
                      children: [
                        Text(
                          ticket.source,
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
                          ticket.destination,
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
                    "Price: ₹"+ ticket.eco_price,
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
  }





  @override
  Widget build(BuildContext context) {

    Controller ctrl = new Controller();
    print("Here");
    // fetchFlights();
    final CollectionReference _flights = FirebaseFirestore.instance.collection('flights');

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flight tickets'),
      ),
      body: Column(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // children: flights.map((e) => HomeTemplate(e, w, h)).toList()

            // [Text('Nothing to print'),]
            // (flights.isEmpty() == false) ?

            // Text('No Flights available'),
          ),
          // StreamBuilder(
          //     stream: _flights.snapshots(),
          //     builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot),
          // ),
          Spacer(),
          Column(
            children: [
              Container(
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, h * 0.01, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child:
                          ctrl.IsAdmin()?

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, h * 0.01, 0, h * 0.01),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Column(children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: w * 0.09,
                                  color: Colors.black,
                                ),
                              ]),
                              (ctrl.IsLoggedIn() == false) ? Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: Icon(
                                      Icons.login,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ):
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/addItem");
                                    },
                                    child: Icon(
                                      Icons.add_box,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, h * 0.01, 0, h * 0.01),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Column(children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  size: w * 0.09,
                                  color: Colors.black,
                                ),
                              ]),
                              (ctrl.IsLoggedIn() == false) ? Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: Icon(
                                      Icons.login,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ):
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
