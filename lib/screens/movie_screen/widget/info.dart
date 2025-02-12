import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
                                  height: 20,
                                  width: 50,
                                  color: const Color.fromARGB(255, 51, 50, 50),
                                  child: Center(
                                      child: Text('U/A 16+',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: const Color.fromARGB(
                                                  255, 175, 167, 167),
                                              fontWeight: FontWeight.w500))),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2h 20m',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 51, 50, 50))),
                                  child: Center(
                                      child: Text('HD',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: const Color.fromARGB(
                                                  255, 175, 167, 167),
                                              fontWeight: FontWeight.w500))),
                                ),
      ],
    );
  }
}