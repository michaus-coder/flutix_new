import 'package:flutix_new/bloc/theme_bloc.dart';
import 'package:flutix_new/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/blocs.dart';
import 'bloc/page_bloc.dart';
import 'ui/pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc(OnInitialPage())),
            BlocProvider(create: (_) => UserBloc(UserInitial())),
            BlocProvider(
                create: (_) => ThemeBloc(ThemeState(ThemeData.light()))),
            BlocProvider(
              create: (_) => MovieBloc(MovieInitial())..add(FetchMovie()),
            ),
            BlocProvider(create: (_) => TicketBloc(const TicketState([])))
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()))),
    );
  }
}
