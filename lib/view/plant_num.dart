import 'package:flutter/material.dart';

class Plantnum extends StatefulWidget {
  final String initialValue;
  final Function(String) onChanged;

  Plantnum({required this.initialValue, required this.onChanged});

  @override
  _WeatherDropdownState createState() => _WeatherDropdownState();
}

class _WeatherDropdownState extends State<Plantnum> {
  String _selectedPlant = '';

  @override
  void initState() {
    super.initState();
    _selectedPlant = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    List<String> weatherOptions = ['tomato', 'aubergine', 'cabbage', 'pepper'];

    return DropdownButtonFormField<String>(
      value: _selectedPlant,
      onChanged: (String? newValue) {
        setState(() {
          _selectedPlant = newValue!;
        });
        widget.onChanged(_selectedPlant);
      },
      items: weatherOptions.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      decoration: InputDecoration(labelText: '植物'), // 用 InputDecoration 设置标签
    );
  }
}
