part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final FlutixTransaction transaction;
  SuccessPage(this.ticket, this.transaction);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: FutureBuilder(
              future: ticket != null
                  ? processingTicketOrder(context)
                  : processingTopUp(context),
              builder: (_, snapshot) => (snapshot.connectionState ==
                      ConnectionState.done)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(bottom: 70),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ticket == null
                                        ? "assets/top_up_done.png"
                                        : "assets/ticket_done.png"))),
                          ),
                          Text(
                            (ticket == null) ? "Emm Yummy!" : "Happy Watching!",
                            style: blackTextFont.copyWith(fontSize: 20),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            (ticket == null)
                                ? "You have successfully\ntop up the wallet"
                                : "You have successfully\nbought the ticket",
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          Container(
                            width: 250,
                            margin: EdgeInsets.only(top: 70, bottom: 20),
                            child: ElevatedButton(
                                child: Text(
                                  (ticket == null) ? "My Wallet" : "My Tickets",
                                  style: whiteTextFont.copyWith(fontSize: 16),
                                ),
                                onPressed: () {
                                  if (ticket == null) {
                                    context
                                        .watch<PageBloc>()
                                        .add(GoToWalletPage(GoToMainPage()));
                                  } else {
                                    context.watch<PageBloc>().add(
                                        GoToMainPage(bottomNavBarIndex: 1));
                                  }
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Discovery new movie?",
                                style: greyTextFont.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.watch<PageBloc>().add(GoToMainPage());
                                },
                                child: Text(
                                  "Back to Home",
                                  style: purpleTextFont,
                                ),
                              ),
                            ],
                          )
                        ])
                  : Center(
                      child: SpinKitFadingCircle(
                        color: mainColor,
                        size: 50,
                      ),
                    )),
        ));
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.watch<UserBloc>().add(Purchase(ticket.totalPrice));
    context.watch<TicketBloc>().add(BuyTicket(ticket, transaction.userID));
    await FlutixTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.watch<UserBloc>().add(TopUp(transaction.amount));
    await FlutixTransactionServices.saveTransaction(transaction);
  }
}
