import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
     builder: (context, int value, _){
      return Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          // highlightColor: Colors.transparent
        ),
        child: BottomNavigationBar(
          currentIndex:value,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          backgroundColor: const Color.fromARGB(228, 22, 22, 22),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey, 
          selectedIconTheme: IconThemeData(color: Colors.white, size: 24),
          unselectedIconTheme: IconThemeData(color: Colors.grey,size: 24),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.photo_library_outlined),
                  //     label: 'New & Hot'),
                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.emoji_emotions_outlined),
                  //     label: 'Fast laugh'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.photo_library_outlined), label: 'New & Hot',),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.rectangle,color: Colors.blue,), label: 'My Nefflix'),
          ],
        ),
      );
     },
     );
  }
}