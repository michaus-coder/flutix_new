part of 'pages.dart';

class Checkoutpage extends StatefulWidget {
  final models.Ticket ticket;
  Checkoutpage(this.ticket);
  @override
  _CheckoutpageState createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;
    return WillPopScope(
        onWillPop: () async {
          context.watch<PageBloc>().add(GoToSelectSeatPage(widget.ticket));
          return true;
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: accentColor1,
              ),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              // Back Button
              ListView(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .watch<PageBloc>()
                                  .add(GoToSelectSeatPage(widget.ticket));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Page Title
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                      models.User user = (userState as UserLoaded).user;
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "Checkout\nMovie",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 70,
                                height: 90,
                                margin: EdgeInsets.only(
                                    left: defaultMargin, right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(imageBaseURL +
                                            "w342" +
                                            widget
                                                .ticket.movieDetail.posterPath),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      child: Text(
                                        widget.ticket.movieDetail.title,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18),
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        2 * defaultMargin -
                                        70 -
                                        20,
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      widget
                                          .ticket.movieDetail.genresAndLanguage,
                                      style: greyTextFont.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Ratingstars(
                                    voteAverage:
                                        widget.ticket.movieDetail.voteAverage,
                                    color: accentColor3,
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: defaultMargin),
                            child: Divider(
                              color: Color(0xFFE4E4E4),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Order ID",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  widget.ticket.bookingCode,
                                  style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Cinema",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    widget.ticket.theater.name,
                                    textAlign: TextAlign.end,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Date & Time",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  widget.ticket.time.dateAndTime,
                                  style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Seat Number",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    widget.ticket.seatsInString,
                                    textAlign: TextAlign.end,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Price",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  "IDR 25.000 x  ${widget.ticket.seats.length}",
                                  style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Fee",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  "IDR 1.500 x ${widget.ticket.seats.length}",
                                  style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Total",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: 'IDR ')
                                      .format(total),
                                  style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: defaultMargin),
                            child: Divider(
                              color: Color(0xFFE4E4E4),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Your Wallet",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: 'IDR ')
                                      .format(user.balance),
                                  style: whiteNumberFont.copyWith(
                                      color: user.balance >= total
                                          ? Color(0XFF3E9D9D)
                                          : Color(0xFFFF5C83),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 46,
                            margin: EdgeInsets.only(top: 36, bottom: 50),
                            child: ElevatedButton(
                                child: Text(
                                  user.balance >= total
                                      ? "Checkout Now"
                                      : "Top Up My Wallet",
                                  style: whiteTextFont.copyWith(fontSize: 16),
                                ),
                                onPressed: () {
                                  if (user.balance >= total) {
                                    models.FlutixTransaction transaction =
                                        models.FlutixTransaction(
                                            userID: user.id,
                                            title:
                                                widget.ticket.movieDetail.title,
                                            subtitle:
                                                widget.ticket.theater.name,
                                            time: DateTime.now(),
                                            amount: -total,
                                            picture: widget
                                                .ticket.movieDetail.posterPath);
                                    context.watch<PageBloc>().add(
                                        GoToSuccessPage(
                                            widget.ticket.copyWith(
                                                totalPrice: total,
                                                bookingCode: '',
                                                movieDetail:
                                                    widget.ticket.movieDetail,
                                                theater: widget.ticket.theater,
                                                time: widget.ticket.time,
                                                seats: widget.ticket.seats,
                                                name: widget.ticket.name),
                                            transaction));
                                  } else {
                                    // # uang tidak cukup
                                  }
                                }),
                          )
                        ],
                      );
                    })
                  ]),
                ],
              ),
            ],
          ),
        ));
  }
}
