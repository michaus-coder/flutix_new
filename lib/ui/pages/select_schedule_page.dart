part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final models.MovieDetail movieDetail;
  SelectSchedulePage(this.movieDetail);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  late List<DateTime> dates;
  late DateTime selectedDate;
  late int selectedTime;
  late models.Theater selectedTheater;
  bool isValid = false;
  void initState() {
    super.initState();
    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
            ListView(
              children: <Widget>[
                //Back Icon Button
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, left: defaultMargin),
                      padding: EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .watch<PageBloc>()
                              .add(GoToMovieDetailPage(widget.movieDetail));
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                //Choose Date
                Container(
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 16),
                  child: Text(
                    "Choose Date",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultMargin : 0,
                          right:
                              (index < dates.length - 1) ? 16 : defaultMargin),
                      child: DateCard(
                        dates[index],
                        isSelected: selectedDate == dates[index],
                        onTap: () {
                          setState(() {
                            selectedDate = dates[index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // Choose Time
                generateTimeTable(),
                // next Button
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => FloatingActionButton(
                        elevation: 0,
                        backgroundColor:
                            (isValid) ? mainColor : Color(0xFFF4F4F4),
                        child: Icon(
                          Icons.arrow_forward,
                          color: isValid ? Colors.white : Color(0xFFBEBEBE),
                        ),
                        onPressed: () {
                          if (isValid) {
                            context.watch<PageBloc>().add(GoToSelectSeatPage(
                                models.Ticket(
                                    widget.movieDetail,
                                    selectedTheater,
                                    DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        selectedTime),
                                    randomAlphaNumeric(12).toUpperCase(),
                                    [],
                                    (userState as UserLoaded).user.name,
                                    0)));
                          }
                        }),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onWillPop: () async {
        context.watch<PageBloc>().add(GoToMovieDetailPage(widget.movieDetail));
        return true;
      },
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
