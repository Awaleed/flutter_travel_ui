import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({Key key, this.destination}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
