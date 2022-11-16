import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:sdp_project/models/flights.dart';

class AddFlight extends StatelessWidget {
  // const AddFlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text(
          "Add Flight",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StateFulAddFlight(),
    );
  }
}

class StateFulAddFlight extends StatefulWidget {
  // const StateFulAddFlight({Key? key}) : super(key: key);

  @override
  State<StateFulAddFlight> createState() => _StateFulAddFlightState();
}

class _StateFulAddFlightState extends State<StateFulAddFlight> {

  TextEditingController dateCtl = TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  TextEditingController sourceCtl = TextEditingController();
  TextEditingController destCtl = TextEditingController();
  TextEditingController cmpCtl = TextEditingController();
  TextEditingController idCtl = TextEditingController();
  TextEditingController seatEcoCtl = TextEditingController();
  TextEditingController seatBusCtl = TextEditingController();
  TextEditingController priceEcoCtl = TextEditingController();
  TextEditingController priceBusCtl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var dropdownItemList = [
      {
        'label': 'Air India',
        'value': 'aindia',
        'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 40,
          width: 40,
          child: Image.asset("assets/images/Air India.png"),
        ),
      }, // label is required and unique
      {
        'label': 'Vistara',
        'value': 'vistara',
        'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 40,
          width: 40,
          child: Image.asset("assets/images/Vistara.png"),
        ),
      },
      {
        'label': 'Emirates',
        'value': 'emirates',
        'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 40,
          width: 40,
          child: Image.asset("assets/images/Emirates.png"),
        ),
      },
      {'label': 'None of Above', 'value': 'non'},
    ];

    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.fill,
        //     image: AssetImage("assets/images/background.jpeg"),
        //   )
        // ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h*0.03,
              ),

              // Source
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: TextField(
                  controller: sourceCtl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: "Source",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              // Destination
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: TextField(
                  controller: destCtl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: "Destination",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              // DropDown
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Company: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    CoolDropdown(
                      dropdownList: dropdownItemList,

                      onChange: (value) {
                        cmpCtl.text = value["label"];
                        print("Selected Company : " + value["label"]);
                      },
                      defaultValue: dropdownItemList[3],
                      dropdownHeight: h * 0.33,
                      dropdownItemHeight: h * 0.07,
                      // placeholder: 'insert...',
                    )
                  ],
                ),
              ),

              // Flight ID
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: TextField(
                  controller: idCtl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: "Flight ID",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Image(image: AssetImage("assets/images/Gif1.gif"),
                    //   width: 1*w,
                    // ),
                    Column(
                      children: [
                        Text(
                          "Economy class",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            controller: seatEcoCtl,
                            decoration: InputDecoration(
                              labelText: "Seats",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            controller: priceEcoCtl,
                            decoration: InputDecoration(
                              labelText: "Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                        // Field
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Business Class",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            controller: seatBusCtl,
                            decoration: InputDecoration(
                              labelText: "Seats",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            controller: priceBusCtl,
                            decoration: InputDecoration(
                              labelText: "Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.06, h * 0.01, w * 0.01, h * 0.01),
                      child: Container(
                        width: w * 0.42,
                        child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            labelText: "Date of flight",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onTap: () async {
                            DateTime? date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            dateCtl.text =
                                DateFormat('dd/MM/yyyy').format(date!);
                          },
                        ),
                      )
                      // child:showTimePicker(context: context, initialTime: DateTime(2022,10,12,0,0,0,0,0,0))
                      ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.01, h * 0.01, w * 0.06, h * 0.01),
                      child: Container(
                        width: w * 0.42,
                        child: TextFormField(
                          controller: timeCtl,
                          decoration: InputDecoration(
                            labelText: "Time of flight",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onTap: () async {
                            TimeOfDay? time;
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            time = (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 7, minute: 15),
                            ));
                            timeCtl.text =
                                '${time?.hour.toString()!} : ${time?.minute.toString()!}';
                          },
                        ),
                      )
                      // child:showTimePicker(context: context, initialTime: DateTime(2022,10,12,0,0,0,0,0,0))
                      ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      print("On pressed button called\n<-----------------------------------------------------------------\n<-----------------------------------------------------------");
                      String source = sourceCtl.text.trim();
                      String destination = destCtl.text.trim();
                      String dateOfFlight = dateCtl.text.trim();
                      String timeOfFlight = timeCtl.text.trim();
                      String company = cmpCtl.text.trim();
                      String cap_Economy =(seatEcoCtl.text.toString()).trim();
                      String cap_Business = (seatBusCtl.text.toString()).trim();
                      String price_Business =(priceBusCtl.text.toString()).trim();
                      String price_Economy = (priceEcoCtl.text.toString()).trim();
                      String availableEco = cap_Economy;
                      String availableBus = cap_Business;
                      String aircraft = idCtl.text;


                      final fbcol = FirebaseFirestore.instance.collection("flights").doc();
                      final flight = Flight(source, destination, dateOfFlight, timeOfFlight,
                        cap_Economy, cap_Business, company, aircraft, price_Economy, price_Business, availableEco, availableBus
                      );

                      final json = flight.toJson();
                      print(json);
                      await fbcol.set(json);

                      Navigator.pushNamed(context, '/mainPage');



                    },


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add Flight",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
