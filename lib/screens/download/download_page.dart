import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGcolor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,),color: Colors.white,),
        title: Text('Downloads',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: bGcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align( alignment: Alignment.center,
              child: Text('Introducing Downloads for You',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),)),
              SizedBox(height: 5,),
            Text.rich(
  TextSpan(
    children: [
          TextSpan(
            text: "We'll download a personalised selection\n",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          TextSpan(
            text: "of movies and shows for you,so there's\n",
            style: TextStyle(color: Colors.grey, fontSize: 15,),
          ),
          TextSpan(
            text: "always something to watch on your device",
            style: TextStyle(color: Colors.grey, fontSize: 15,),
          ),
        ],
      ),
    ),
    Image.asset('assets/download.jpg',height: 300, width: 350,fit: BoxFit.fill,),
    SizedBox(height: 30,),
    ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize: Size(350, 50),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),backgroundColor: const Color.fromARGB(255, 9, 119, 210),), child: Text('Set Up',style: TextStyle(color: Colors.white,fontSize: 17),),),
    SizedBox(height: 10,),
    ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),backgroundColor: Colors.white,), child: Text('See What You Can Download',style: TextStyle(color: Colors.black,fontSize: 17),),),
          ],
        ),
      ),
    );
  }
}