import 'package:flutter/material.dart';

class WeatherDropdown extends StatefulWidget {
  final String initialValue;
  final Function(String) onChanged;

  WeatherDropdown({required this.initialValue, required this.onChanged});

  @override
  _WeatherDropdownState createState() => _WeatherDropdownState();
}

class _WeatherDropdownState extends State<WeatherDropdown> {
  String _selectedWeather = '';

  @override
  void initState() {
    super.initState();
    _selectedWeather = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    List<String> weatherOptions = ['clear', 'cloudy', 'rainy', 'snowy'];

    return DropdownButtonFormField<String>(
      value: _selectedWeather,
      onChanged: (String? newValue) {
        setState(() {
          _selectedWeather = newValue!;
        });
        widget.onChanged(_selectedWeather);
      },
      items: weatherOptions.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      decoration: InputDecoration(labelText: '天气'), // 用 InputDecoration 设置标签
    );
  }
}
