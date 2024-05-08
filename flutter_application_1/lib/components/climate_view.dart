import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';

class ClimateView extends StatefulWidget {
  const ClimateView({Key? key}) : super(key: key);

  @override
  ClimateViewState createState() => ClimateViewState();
}

class ClimateViewState extends State<ClimateView> {
  double _temperature = 24.0;
  double _currentTempSliderValue = 23.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Climate',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const Spacer(),
          _buildClimateItem(
              'INTERIOR: ', '${_currentTempSliderValue + 1}\u{00B0} C'),
          const Spacer(),
          _buildClimateDegreeItem(
              '$_currentTempSliderValue\u{00B0} C', Icons.ac_unit),
          const Spacer(),
          _buildClimateWindowItem('WINDOW CLOSED'),
          const Spacer(),
          _buildTemperatureSlider()
        ],
      ),
    );
  }

  Widget _buildClimateItem(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildClimateWindowItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.0, color: Colors.grey[300]),
        ),
      ],
    );
  }

  Widget _buildClimateDegreeItem(String value, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 36.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Icon(
          iconData,
          color: ColorUtils.appGreen,
        ),
      ],
    );
  }

  Widget _buildTemperatureSlider() {
    return Stack(
      children: [
        Slider(
          value: _temperature,
          min: 10.0,
          max: 40.0,
          divisions: 30, // Increase divisions for more scale points
          activeColor: ColorUtils.appGreen,
          secondaryActiveColor: Colors.amber,
          onChanged: (double value) {
            setState(() {
              _temperature = value;
            });
          },
          onChangeEnd: (double value) {
            setState(() {
              _currentTempSliderValue = value;
            });
          },
          label: '$_temperature°',
          semanticFormatterCallback: (double value) =>
              '${value.round()}\u{00B0} C',
        ),
      ],
    );
  }
}
