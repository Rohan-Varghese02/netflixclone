import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 5,),
        Center(child: Image(image: NetworkImage('https://i.pinimg.com/736x/92/b4/e7/92b4e7c57de1b5e1e8c5e883fd915450.jpg',scale: 10),),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Rohan',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400),),
            Icon(Icons.arrow_drop_down_outlined,color: Colors.white,)
          ],
        )
        
      ],
    );
  }
}