import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './ui/pages/start_page.dart';
import './db/migrate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await initializeDatabase();
  } catch (e) {
    debugPrint('マイグレーションに失敗しました: $e');
  }

  const app = MaterialApp(home: StartPage());
  const scope = ProviderScope(child: app);
  runApp(scope);
}
