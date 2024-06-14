class ItemsDataSourceImpl {

  List<ItemModel> fetchData() async {
    await Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Oggetti');
    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;
      if (values.isEmpty) {
        notifyError("Nessun elemento trovato");
      } else {
        log('db riciclo lenght: ${values.length}');
        List<ItemModel> items = [];
        values.forEach((key, value) {
          log('db value: $value');
          items.add(ItemModel.fromJson(key, value));
        });
        return items;
      }
    });

  }

}
