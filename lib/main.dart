import 'package:beraca_plus_optique/feature/overview.dart';
import 'package:flutter/material.dart';
import 'package:beraca_plus_optique/core/constante/params.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      databaseURL: 'https://epbomie-default-rtdb.firebaseio.com',
      apiKey: GlobalParams.apiKey,
      appId: GlobalParams.appId,
      messagingSenderId: GlobalParams.messagingSenderId,
      projectId: GlobalParams.projectId,
      storageBucket: GlobalParams.storageBucket,
    ),
  );
 

  await initializeDateFormatting('fr', null);

  await Supabase.initialize(
    url: GlobalParams.supabaseUrl,
    anonKey: GlobalParams.supabaseAnonKey,
  );

  runApp(const OverviewScreen());
}

