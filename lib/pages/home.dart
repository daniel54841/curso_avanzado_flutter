import 'dart:io';

import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "2", name: "Fito y Fitipaldis", votes: 2),
    Band(id: "3", name: "Marea", votes: 1),
    Band(id: "4", name: "Heroes del Silencio", votes: 3),
    Band(id: "5", name: "Queen", votes: 4),
    Band(id: "6", name: "Linking Park", votes: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Center(
          child: Text(
            'BandNames',
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) {
          return _bandTile(bands[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id!),
      direction: DismissDirection.startToEnd, //betar lado para eliminar
      onDismissed: (direction) {
        //TODO: llamar borrado en back
      },

      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(left: 8.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Delete Band",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(
            band.name!.substring(0, 2),
          ),
        ),
        title: Text(band.name!),
        trailing: Text(
          "${band.votes}",
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New Band Name: "),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text),
                child: const Text("Add"),
              ),
            ],
          );
        },
      );
    }
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context); //cerrar el dialogo
  }
}
