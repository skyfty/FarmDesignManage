import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/widget/WeatherDropdown.dart';

class Weather extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Weather> {
  String selectedWeather = 'clear';

  void updateWeather(String newWeather) {
    setState(() {
      selectedWeather = newWeather;
    });
  }

  void saveWeatherToBackend() async {
    // 将selectedWeather的值保存到后端接口
    var url = Uri.parse('http://192.168.33.212:3007/query.php'); // 替换为实际的后端接口地址
    final response = await http.post(
      url,
      body: {
        'weather': selectedWeather,
      },
    );
    if (response.statusCode == 200) {
      print('天气数据保存成功');
      Fluttertoast.showToast(msg: response.body);
      print(response.body);
    } else {
      print('天气数据保存失败，请重试');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改天气'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherDropdown(
              initialValue: selectedWeather,
              onChanged: updateWeather,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveWeatherToBackend,
              child: Text('保存天气数据到后端'),
            ),
          ],
        ),
      ),
    );
  }
}
