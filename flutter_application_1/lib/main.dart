import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';
import 'package:flutter_application_1/Screens/dashboard_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AppBarBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Center(
          child: DashboardView(),
        ),
      ),
    );
  }
}

class AppBarBloc extends Cubit<String> {
  AppBarBloc() : super('Dashboard');

  void updateTitle(String newTitle) => emit(newTitle);
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc, String>(
      builder: (context, title) {
        return AppBar(
          backgroundColor: ColorUtils.appBlack,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                    icon: Icon(Icons.menu, color: ColorUtils.appWhite),
                    onPressed: () {
                      // Handle menu button press
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: TextStyle(color: ColorUtils.appWhite),
                    ),
                  ),
                  const Expanded(
                    flex: 5,
                    child: SearchBar(),
                  ),
                  const Spacer(),
                  const WeatherButton(),
                  const NotificationButton(),
                  const ProfileButton(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: ColorUtils.appGrey,
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8.0),
          Text(
            'Search ',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class WeatherButton extends StatelessWidget {
  const WeatherButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.wb_sunny, color: ColorUtils.appWhite),
      onPressed: () {
        // Handle weather button press
      },
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications, color: ColorUtils.appWhite),
      onPressed: () {
        // Handle notification button press
      },
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
                    padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
      icon: Icon(Icons.account_circle, color: ColorUtils.appWhite),
      onPressed: () {
        // Handle profile button press
      },
    );
  }
}
