import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zarity_health_task/feature/Blog/data/models/blog.dart';
import 'core/theme/theme.dart';
import 'feature/Blog/data/data_sources/blog_remote_data_source.dart';
import 'feature/Blog/data/repositories/blog_repository_impl.dart';
import 'feature/Blog/domain/repositories/blog_repository.dart';
import 'feature/Blog/presentation/pages/bloc/blog_bloc.dart';
import 'feature/Blog/presentation/pages/blog_screen.dart';
import 'feature/Blog/presentation/pages/individual_blog_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BlogRepository>(
      create: (context) =>
          BlogRepositoryImpl(blogDataSource: BlogRemoteDataSourceImpl()),
      child: BlocProvider(
        create: (context) => BlogBloc(context.read<BlogRepository>()),
        child: MaterialApp.router(
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: AppTheme.lightThemeMode,
          darkTheme: AppTheme.darkThemeMode,
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => const MaterialPage(
                  child: BlogScreen(),
                ),
              ),
              GoRoute(
                path: '/blog/:id',
                pageBuilder: (context, state) {
                  final id = state.pathParameters['id'];
                  return MaterialPage(
                    child: IndividualBlogScreen(id: id ?? ''),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
