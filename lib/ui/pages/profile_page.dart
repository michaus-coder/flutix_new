part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.watch<PageBloc>().add(GoToMainPage());

        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: <Widget>[
                  BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) {
                      if (userState is UserLoaded) {
                        models.User user = userState.user;

                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 74, bottom: 10),
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitFadingCircle(
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: 120,
                                    // height: 120,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/user_pic.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              child: Text(
                                user.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: blackTextFont.copyWith(fontSize: 18),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              margin: EdgeInsets.only(top: 8, bottom: 30),
                              child: Text(
                                user.email,
                                textAlign: TextAlign.center,
                                style: greyTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        );
                      } else
                        return SizedBox();
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => GestureDetector(
                          onTap: () {
                            context.watch<PageBloc>().add(GoToEditProfilePage(
                                (userState as UserLoaded).user));
                          },
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child:
                                      Image.asset("assets/edit_profile.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Edit Profile",
                                style: blackTextFont.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: FDottedLine(
                            color: Color(0xFFE4E4E4),
                            width: 312.0,
                          )),
                      GestureDetector(
                        onTap: () {
                          context
                              .watch<PageBloc>()
                              .add(GoToWalletPage(GoToProfilePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("assets/my_wallet.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Wallet",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: FDottedLine(
                            color: Color(0xFFE4E4E4),
                            width: 312.0,
                          )),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/language.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Language",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: FDottedLine(
                            color: Color(0xFFE4E4E4),
                            width: 312.0,
                          )),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/help_centre.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Help Centre",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: FDottedLine(
                            color: Color(0xFFE4E4E4),
                            width: 312.0,
                          )),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/rate.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Rate Flutix App",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: FDottedLine(
                            color: Color(0xFFE4E4E4),
                            width: 312.0,
                          )),
                      GestureDetector(
                        onTap: () async {
                          await AuthServices.signOut();
                          context.watch<UserBloc>().add(SignOut());
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                      color: accentColor2,
                                    ),
                                    Icon(
                                      MdiIcons.logout,
                                      color: mainColor,
                                      size: 24,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sign Out",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: FDottedLine(
                            color: Color(0xFFE4E4E4),
                            width: 312.0,
                          )),
                    ],
                  )
                ],
              ),
            ),
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  context.watch<PageBloc>().add(GoToMainPage());
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
