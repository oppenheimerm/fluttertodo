import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filterType = "today";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Color(0xfff96060),
                elevation: 0,
                title: Text("Work List", style: TextStyle(
                  fontSize: 30
                ),),
                actions: [
                  IconButton(
                      icon: Icon(
                          Icons.short_text,
                      color: Colors.white,
                      size: 30,),
                      onPressed: (){}
                  )
                ],
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Text("Today", style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          height: 4,
                          width: 120,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Text("Monthly", style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          height: 4,
                          width: 120,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
