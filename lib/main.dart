import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kgk_diamonds/bloc/cart/cart_bloc.dart';
import 'package:kgk_diamonds/routes.dart';

import 'bloc/filter/filter_bloc.dart';
import 'models/diamond_cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiamondAdapter());
  final box = await Hive.openBox<Diamond>('cartBox');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FilterBloc()),
        BlocProvider(create: (_) => CartBloc(box)),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KGK Diamonds',
      initialRoute: AppRoutes.filterPage,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
