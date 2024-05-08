import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorUtils.appGrey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'My Calendar',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: ColorUtils.appWhite),
          ),
          Text(
            '03 May - 2024',
            style: TextStyle(fontSize: 12.0, color: ColorUtils.appLightGrey),
          ),
          Row(
            children: [
              _buildLeftPanel(),
              Expanded(
                child: SizedBox(
                  height: 140.0, // Adjust the height as needed
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        1,
                        (index) => _buildMeetingCard(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeftPanel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: 50.0, // Width of the left panel
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTimeRow('9:00 AM'),
          const SizedBox(
              height: 20.0), // Adjust space between times and dotted lines
          _buildTimeRow('10:00 AM'),
          // Add more time rows as needed
        ],
      ),
    );
  }

  Widget _buildTimeRow(String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        time,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12.0, color: ColorUtils.appWhite),
      ),
    );
  }

  Widget _buildMeetingCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            height: 60.0, // Adjust the height of the meeting card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: ColorUtils.appGrey, // Background color of the meeting card
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4.0, // Width of the green strip
              decoration: BoxDecoration(
                color: ColorUtils.appGreen, // Color of the green strip
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Positioned(
            left: 8.0, // Adjust distance from green strip
            top: 0,
            bottom: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Meeting Name',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.appWhite),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '5:00 PM - 6:30 PM', // Example time range
                  style: TextStyle(
                    fontSize: 14.0,
                    color: ColorUtils.appLightGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
