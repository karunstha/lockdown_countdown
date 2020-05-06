import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFC107),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Column(
              children: <Widget>[],
            ),
            new Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text(
                    "4",
                    style:
                        TextStyle(fontSize: 120.0, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "days to go",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0.8,
                        )
                      ],
                      color: Colors.white),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      onTap: () => {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Row(
                          children: <Widget>[
                            Image.network(
                                "https://sc01.alicdn.com/kf/H4ab95307db934994ad7c351357e406f3T/nepal-hand-flag.jpg_640x640.jpg",
                                width: 26,
                                height: 22,
                                fit: BoxFit.contain),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Afganisthan",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              width: 22,
                            ),
                            Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.grey.shade800,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
