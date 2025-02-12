import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    )),child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_arrow,color: Colors.black,size: 35,),
          Text('Play',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500),),
        ],
      ),
    ));
  }
}