import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTemplate extends StatefulWidget {
  // const HomeTemplate({Key? key}) : super(key: key);

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget HomeTemplate(ticket, w, h) {
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
                    AssetImage('assets/images/' + ticket['company'] + '.png'),
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
                          ticket['destination'],
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
                    "Price: ₹"+ ticket['eco_price'],
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
}
