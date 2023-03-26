import 'package:flutter/material.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // profile data =======
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                height: 80,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
                clipBehavior: Clip.antiAlias,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mina Shawky",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "minashawky12@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              )
            ],
          ),

          Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5,),

                    Expanded(

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              fixedSize: Size(10, 300)),
                      onPressed: () {},
                      child: Text("Segmentation",style: TextStyle(fontSize: 20),),
                    )),
                    SizedBox(width: 5,),
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                      fixedSize: Size(10, 300)),
                      onPressed: () {},
                      child: Text("grading",style: TextStyle(fontSize: 20)),
                    )),
                    SizedBox(width: 5,),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
