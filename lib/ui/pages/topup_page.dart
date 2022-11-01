part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;
  TopUpPage(this.pageEvent);
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController ammountController =
      TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;
  @override
  Widget build(BuildContext context) {
    context.watch<ThemeBloc>().add(
        ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xFFE4E4E4))));
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;
    return WillPopScope(
      onWillPop: () async {
        context.watch<PageBloc>().add(widget.pageEvent);
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: <Widget>[
                SafeArea(
                    child: Container(
                  margin: EdgeInsets.only(top: 20, left: defaultMargin),
                  child: GestureDetector(
                    onTap: () {
                      context.watch<PageBloc>().add(widget.pageEvent);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                )),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Top Up",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        onChanged: (text) {
                          String temp = '';
                          for (var i = 0; i < text.length; i++) {
                            temp += text.isDigit(i) ? text[i] : '';
                          }
                          setState(() {
                            selectedAmount = int.tryParse(temp) ?? 0;
                          });
                          ammountController.text = NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(selectedAmount);
                          ammountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: ammountController.text.length));
                        },
                        controller: ammountController,
                        decoration: InputDecoration(
                            labelStyle: greyTextFont,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Amount"),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 14),
                          child: Text(
                            "Choose by Template",
                            style: blackTextFont,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 14,
                        children: <Widget>[
                          makeMoneyCard(
                            amount: 50000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 100000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 150000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 200000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 250000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 500000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 1000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 1500000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 2500000,
                            width: cardWidth,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: 250,
                        height: 46,
                        child: BlocBuilder<UserBloc, UserState>(
                            builder: (_, userState) => ElevatedButton(
                                child: Text(
                                  "Top Up My Wallet",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      color: (selectedAmount > 0)
                                          ? Colors.white
                                          : Color(0xFFBEBEBE)),
                                ),
                                onPressed: (selectedAmount > 0)
                                    ? () {
                                        // context.watch<PageBloc>().add(
                                        //     GoToSuccessPage(
                                        //         models.Ticket(models.MovieDetail(), null, null,
                                        //             null, null, null, null),
                                        //         models.FlutixTransaction(
                                        //             picture: "",
                                        //             userID: (userState
                                        //                     as UserLoaded)
                                        //                 .user
                                        //                 .id,
                                        //             title: "Top Up Wallet",
                                        //             amount: selectedAmount,
                                        //             subtitle:
                                        //                 "${DateTime.now().dayname}, ${DateTime.now().day} ${DateTime.now().monthname} ${DateTime.now().year}",
                                        //             time: DateTime.now())));
                                      }
                                    : null)),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  MoneyCard makeMoneyCard({required int amount, required double width}) {
    return MoneyCard(
      amount: amount,
      width: width,
      isSelected: amount == selectedAmount,
      onTap: () {
        setState(() {
          if (selectedAmount != amount) {
            selectedAmount = amount;
          } else {
            selectedAmount = 0;
          }
          ammountController.text = NumberFormat.currency(
                  locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
              .format(selectedAmount);
          ammountController.selection = TextSelection.fromPosition(
              TextPosition(offset: ammountController.text.length));
        });
      },
    );
  }
}
