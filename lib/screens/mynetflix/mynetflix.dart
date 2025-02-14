import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/screens/home/widgets.dart/appBar_widgets.dart';
import 'package:netflix/screens/mynetflix/widgets/profile_pic_widget.dart';

class Mynetflix extends StatelessWidget {
  const Mynetflix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGcolor,
      appBar: AppBar(
        backgroundColor: bGcolor,
        title: Text('My Netflix',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
        actions: [
          screenShareButton(context),
    downloadButton(context),
    searchButton(context)
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePicWidget(),
            SizedBox(height: 5,),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcW8pE2Cc9B2HTVeHtpgCTVUCuRcOhjHJUSg&s'),),
                    title: Text('Notification',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                    ),
                    SizedBox(height: 5,),
                    ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pinimg.com/736x/b1/f8/6e/b1f86e8c2ac91b9c6803fa96bf992114.jpg'),),
                    title: Text('Downloads',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                    ),
                ],
              ),
            )
          ],
      ),
    );
  }
}
