import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          ListView.builder(
            itemCount: 0,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text(''),
              );
            },
          )
        ],
      ),
    );
  }
}
