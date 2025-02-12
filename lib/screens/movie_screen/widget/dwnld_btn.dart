import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DwnldBtn extends StatelessWidget {
  const DwnldBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ), backgroundColor: const Color.fromARGB(255, 20, 20, 20)),child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.download,color: Colors.white,size: 35,),
          Text('Download',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500),),
        ],
      ),
    ));
  }
}