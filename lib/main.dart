import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_media_app/app/Constants/app_fonts.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';
import 'package:social_media_app/app/Constants/color.dart';
import 'package:social_media_app/app/Routes/app_pages.dart';
import 'package:social_media_app/app/Widget/size_config.dart';
import 'package:social_media_app/app/initial_binding.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GraphQLClient client = GraphQLClient(
    link: HttpLink(
      AppStrings.graphQLUrl, // Replace with your Hasura API URL
    ),
    cache: GraphQLCache(store: InMemoryStore()),
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Sizer(builder: (context, orientation, deviceType) {
          return GraphQLProvider(
            client: ValueNotifier<GraphQLClient>(client),
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: ThemeData(
                  fontFamily: AppFonts.appFontFamily,
                  primaryColor: AppColors.PRIMARY_COLOR),
              initialRoute: Routes.splash,
              defaultTransition: Transition.downToUp,
              getPages: AppPages.pages,
              initialBinding: InitialBinding(),
            ),
          );
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
