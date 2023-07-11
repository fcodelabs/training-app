import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseConfig {
  static Future<void> initialize() async {
    await dotenv.load();

    const firebaseOptions = FirebaseOptions(
      apiKey: 'API_KEY',
      authDomain: 'AUTH_DOMAIN',
      projectId: 'PROJECT_ID',
      storageBucket: 'STORAGE_BUCKET',
      messagingSenderId: 'MESSAGING_SENDER_ID',
      appId: 'APP_ID',
    );

    await Firebase.initializeApp(
      options: firebaseOptions,
      name: 'dearDiaryApp',
    );
  }
}
