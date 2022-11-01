part of 'services.dart';

class FlutixTransactionServices {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');
  static Future<void> saveTransaction(
      model.FlutixTransaction flutixTransaction) async {
    await transactionCollection.doc().set({
      'userID': flutixTransaction.userID,
      'title': flutixTransaction.title,
      'subtitle': flutixTransaction.subtitle,
      'time': flutixTransaction.time.millisecondsSinceEpoch,
      'amount': flutixTransaction.amount,
      'picture': flutixTransaction.picture
    });
  }

  static Future<List<model.FlutixTransaction>> getTransaction(
      String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();

    var documents = snapshot.docs.where((document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return data['userID'] == userID;
    });

    return documents.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return model.FlutixTransaction(
          userID: data['userID'],
          title: data['title'],
          subtitle: data['subtitle'],
          time: DateTime.fromMillisecondsSinceEpoch(data['time']),
          amount: data['amount'],
          picture: data['picture']);
    }).toList();
  }
}
