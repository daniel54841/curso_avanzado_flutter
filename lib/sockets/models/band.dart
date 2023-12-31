class Band {
  String? id; //generado por Backend
  String? name;
  int? votes;

  Band({this.id, this.name, this.votes});

  //factory constructor, constructor que recibe datos y devuelve una instancia de la clase
  factory Band.fromMap(Map<String, dynamic> obj) {
    return Band(
        id: obj.containsKey("id") ? obj["id"] : "no-id",
        name: obj.containsKey("name") ? obj["name"] : "no-name",
        votes: obj.containsKey("votes") ? obj["votes"] : "no-votes");
  }
}
