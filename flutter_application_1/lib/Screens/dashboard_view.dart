import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';
import 'package:flutter_application_1/components/calendar_view.dart';
import 'package:flutter_application_1/components/car_model_view.dart';
import 'package:flutter_application_1/components/climate_view.dart';
import 'package:flutter_application_1/components/map_view.dart';
import 'package:flutter_application_1/components/player_song_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorUtils.appBlack,
      ),
      child: Row(
        children: [
          _buildSideButton(),
          const SizedBox(width: 16),
          _buildLeftView(),
          const SizedBox(width: 16),
          _buildCarModelView(),
        ],
      ),
    );
  }

  Widget _buildLeftView() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                _buildMapView(),
                const SizedBox(height: 16),
                _buildVerticalTileView(),
              ],
            ),
          ),
          const SizedBox(height: 16), // Add spacing between the two parts
          _buildPlaySongView(),
          const SizedBox(height: 16),
          _buildButton()
        ],
      ),
    );
  }

 Widget _buildPlaySongView() {
  return Stack(
    children: [
      const PlaySongView(),
      Positioned(
        top: -5, // Adjust the top position as needed
        right: 0, // Adjust the right position as needed
        child: IconButton(
          icon: Icon(
            Icons.share,
            color: ColorUtils.appLightGrey,
          ),
          onPressed: () {
            // Add onPressed action for share icon
          },
        ),
      ),
    ],
  );
}

  Widget _buildSideButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircularIconButton(Icons.home),
        const SizedBox(height: 16), // Add spacing between buttons
        _buildCircularIconButton(Icons.camera),
        const SizedBox(height: 16), // Add spacing between buttons
        _buildCircularIconButton(Icons.phone),
        const SizedBox(height: 16), // Add spacing between buttons
        _buildCircularIconButton(Icons.play_circle),
        const SizedBox(height: 16), // Add spacing between buttons
        _buildCircularIconButton(Icons.settings),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 8), // Adjust vertical padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildVerticalIconButton(Icons.opacity, 'Humidity'),
          const SizedBox(height: 16), // Add spacing between buttons
          _buildVerticalIconButton(Icons.speed, 'Wind'),
          const SizedBox(height: 16), // Add spacing between buttons
          _buildVerticalIconButton(Icons.bluetooth, 'Bluetooth'),
          const SizedBox(height: 16), // Add spacing between buttons
          _buildVerticalIconButton(Icons.message, 'Message'),
          const SizedBox(height: 16), // Add spacing between buttons
          _buildSeatAdjustment(),
        ],
      ),
    );
  }

  Widget _buildSeatAdjustment() {
    return Container(
        height: 124,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: ColorUtils.appGrey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Icon(Icons.event_seat_sharp,
                size: 40, color: ColorUtils.appWhite), // Seat icon
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    color: ColorUtils.appWhite,
                  ),
                  onPressed: () {
                    // Add onPressed action to increase value
                  },
                ),
                Text('50',
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorUtils.appWhite)), // Value between 0 and 100
                IconButton(
                  icon: Icon(Icons.arrow_drop_down, color: ColorUtils.appWhite),
                  onPressed: () {
                    // Add onPressed action to decrease value
                  },
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCircularIconButton(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorUtils.appGrey,
        borderRadius: BorderRadius.circular(
            50.0), // Half of the container's width or height for a circle
      ),
      child: Center(
        child: Icon(
          iconData,
          size: 24,
          color: ColorUtils.appWhite,
        ),
      ),
    );
  }

  Widget _buildVerticalIconButton(IconData iconData, String title) {
    return Container(
      height: 124,
      width: 100,
      decoration: BoxDecoration(
        color: ColorUtils.appGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 24,
            color: ColorUtils.appWhite,
          ), // Adjust icon size as needed
          const SizedBox(height: 8), // Add spacing between icon and text
          Text(
            title,
            style: TextStyle(color: ColorUtils.appWhite),
          ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return const Expanded(
      flex: 3,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: AppMapView(), // Use the AppMapView widget
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalTileView() {
    return const Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ClimateView(),
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 4,
            child: CalendarWidget(), // Replace with your calendar view
          ),
        ],
      ),
    );
  }

  Widget _buildCarModelView() {
    return const Expanded(
      flex: 3,
      child: CarModelView(), // Replace with your car model view
    );
  }
}
