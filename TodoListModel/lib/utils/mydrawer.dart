import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/1.jpg")),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50)),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Enes Batur Topal"),
          ],
        )),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Ana Sayfa"),
          onTap: () => Navigator.pushNamed(context, "Welcome"),
        ),
        ListTile(
          leading: const Icon(Icons.today_outlined),
          title: const Text("Home"),
          onTap: () => Navigator.pushNamed(context , "Home"),
        ),
         ListTile(
          leading: const Icon(Icons.developer_mode),
          title: const Text("todolist"),
          onTap: () => Navigator.pushNamed(context, "todolist"),
        )
      ],
    ));
  }
}
