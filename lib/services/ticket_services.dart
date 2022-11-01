part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');
  static Future<void> saveTicket(String id, model.Ticket ticket) async {
    await ticketCollection.doc().set({
      'movieID': ticket.movieDetail.id,
      'userID': id,
      'theaterName': ticket.theater.name,
      'time': ticket.time.millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<model.Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents = snapshot.docs.where((document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return data['userID'] == userId;
    });
    List<model.Ticket> tickets = [];
    for (var document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      model.MovieDetail movieDetail =
          await MovieServices.getDetails(null, movieID: data['movieID']);
      tickets.add(model.Ticket(
          movieDetail,
          model.Theater(data['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(data['time']),
          data['bookingCode'],
          data['seats'].toString().split(','),
          data['name'],
          data['totalPrice']));
    }
    return tickets;
  }
}
