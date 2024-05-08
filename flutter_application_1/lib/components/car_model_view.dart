import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';
import 'package:flutter_application_1/buttons/car_control_button_view.dart';
import 'package:flutter_application_1/buttons/car_circular_button_view.dart';
import 'package:flutter_application_1/components/half_circle_icon_view.dart';
import 'package:flutter_application_1/components/speedometer_view.dart';

class CarModelView extends StatelessWidget {
  const CarModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.appBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildEmergencyView(),
              _buildCircularButtonsRow(),
              const SizedBox(height: 16),
              _buildCarModelView(),
              const SizedBox(height: 30),
              _buildActionButtonsRow(),
              const SizedBox(height: 24),
              _buildHalfCircleButtonsRow(),
              const SizedBox(height: 16),
              const Expanded(
                child: SpeedoMeterView(
                  radius: 120,
                  startAngle: 0,
                  endAngle: 270,
                  speed: 57,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarModelView() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/platform.png'),
          ),
        ),
        Positioned.fill(
          bottom: 20,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/car.png'),
          ),
        ),
        const SizedBox(height: 16),
        _buildLockActionButtonsRow(),
      ],
    );
  }

  Widget _buildEmergencyView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorUtils.appGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.warning, color: ColorUtils.appRed),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emergency',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.appWhite,
                    ),
                  ),
                  Text(
                    'Switch on only in emergency case',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorUtils.appWhite,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: false,
              onChanged: (value) {
                // Add onChanged action for the switch
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularButton(
          size: 100.0,
          iconSize: 24.0,
          title: "L",
          onPressed: () {
            // Action when button is pressed
          },
        ),
        CircularButton(
          size: 100.0,
          iconSize: 24.0,
          title: "R",
          onPressed: () {
            // Action when button is pressed
          },
        ),
      ],
    );
  }

  Widget _buildLockActionButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CarCircularButton(
          iconData: Icons.lock,
          title: "",
          circleColor: ColorUtils.appGrey,
          iconColor: ColorUtils.appWhite,
          onPressed: () {},
        ),
        CarCircularButton(
          iconData: Icons.lock,
          title: "",
          circleColor: ColorUtils.appGreen,
          iconColor: ColorUtils.appBlack,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CarCircularButton(
          iconData: Icons.brightness_6,
          title: "Brightness",
          circleColor: ColorUtils.appGrey,
          iconColor: ColorUtils.appWhite,
          onPressed: () {},
        ),
        CarCircularButton(
          iconData: Icons.fingerprint,
          title: "Fingerprint",
          circleColor: ColorUtils.appGrey,
          iconColor: ColorUtils.appWhite,
          onPressed: () {},
        ),
        CarCircularButton(
          iconData: Icons.analytics,
          title: "Statistics",
          circleColor: ColorUtils.appGrey,
          iconColor: ColorUtils.appWhite,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHalfCircleButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HalfCircleWithIconAndText(
          radius: 70.0,
          color: ColorUtils.appGreen,
          icon: Icons.pest_control_sharp,
          text: 'Petrol\n65%',
          iconColor: ColorUtils.appWhite,
          textColor: ColorUtils.appWhite,
        ),
        HalfCircleWithIconAndText(
          radius: 70.0,
          color: ColorUtils.appGreen,
          icon: Icons.pest_control_sharp,
          text: 'Battery\n60%',
          iconColor: ColorUtils.appWhite,
          textColor: ColorUtils.appWhite,
        ),
      ],
    );
  }
}
