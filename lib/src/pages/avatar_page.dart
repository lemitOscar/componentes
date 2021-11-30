import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://depor.com/resizer/i5IxIBxn13U56XExo2WK2xMqCO4=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/YN4PLEDP3FHPNEVZPBCMJYI2EQ.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('sl'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
    );
  }
}
