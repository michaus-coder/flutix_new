part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseUser = Provider.of<FirebaseAuth>(context);
    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.watch<UserBloc>().add(LoadUser(firebaseUser.currentUser!.uid));
        context
            .watch<TicketBloc>()
            .add(GetTickets(firebaseUser.currentUser!.uid));
        prevPageEvent = GoToMainPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnMovieDetailpage)
                                ? MovieDetailPage(pageState.movie)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetail)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticket)
                                        : (pageState is OnCheckOutPage)
                                            ? Checkoutpage(pageState.ticket)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(pageState.ticket,
                                                    pageState.transaction)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticket)
                                                    : (pageState
                                                            is OnProfilePage)
                                                        ? ProfilePage()
                                                        : (pageState
                                                                is OnTopUpPage)
                                                            ? TopUpPage(
                                                                pageState
                                                                    .pageEvent)
                                                            : (pageState
                                                                    is OnWalletPage)
                                                                ? WalletPage(
                                                                    pageState
                                                                        .pageEvent)
                                                                : (pageState
                                                                        is OnEditProfilePage)
                                                                    ? EditProfilePage(
                                                                        pageState
                                                                            .user)
                                                                    : MainPage(
                                                                        bottomNavBarIndex:
                                                                            (pageState as OnMainPage).bottomNavBarIndex,
                                                                        isExpired:
                                                                            (pageState as OnMainPage).isExpired,
                                                                      ));
  }
}
