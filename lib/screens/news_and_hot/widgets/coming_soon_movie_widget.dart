import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoonMovieWidget(
      {super.key,
      required this.imageUrl,
      required this.overview,
      required this.logoUrl,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Text(month,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                Text(day,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,letterSpacing: 5,color: Colors.white),),
              ],
            ),
            SizedBox(width: 10,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(imageUrl: imageUrl),
                Row(
                  children: [
                    SizedBox(width: size.width*0.2,height: size.height*0.08,
                    child: CachedNetworkImage(imageUrl: logoUrl,alignment: Alignment.centerLeft,),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_none_outlined,size: 25,color: Colors.white,),
                        Text('Remind me',style: TextStyle(color: Colors.white, fontSize: 10),),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Icon(Icons.info_outline_rounded,size: 25,color: Colors.white,),
                        Text('Info',style: TextStyle(color: Colors.white, fontSize: 10),),
                      ],
                    ),
                    SizedBox(width: 10,)
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                Column(
                  children: [
                    Text('Coming on $month $day',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
                SizedBox(height: 5,),
                 Text(overview,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12,overflow: TextOverflow.ellipsis),maxLines: 3,)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
