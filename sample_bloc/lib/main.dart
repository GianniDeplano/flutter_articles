import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/NewsBloc.dart';
import 'package:sample_bloc/data/repository/TheGuardianRepository.dart';
import 'package:sample_bloc/observers/NewsObserver.dart';
import 'package:sample_bloc/views/detail/NewsDetail.dart';
import 'package:sample_bloc/views/homepage/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = NewsObserver();
  final TheGuardianRepository repository = TheGuardianRepository();

  runApp(NewsApp(
    repository: repository,
  ));
}

class NewsApp extends StatelessWidget {
  final TheGuardianRepository repository;

  NewsApp({@required this.repository}) : assert(repository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => NewsBloc(repository: repository),
        child: HomePage(),
      ),
      routes: {
        HomePage.route: (context) => HomePage(),
        NewsDetail.route: (context) => NewsDetail(),
      },
    );
  }
}
