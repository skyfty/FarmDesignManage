import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/main.dart';
import 'package:weather/view/plant.dart';

class DataList extends StatefulWidget {
  @override
  _DataButtonListState createState() => _DataButtonListState();
}

class _DataButtonListState extends State<DataList> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Replace this with your actual API endpoint for the POST request
    String apiUrl = 'http://192.168.33.212:3004/index.php';

    try {
      var response = await http.post(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          data = List<Map<String, dynamic>>.from(
            json.decode(response.body)['data'],
          );
        });

      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据条'),
        actions: [
          TextButton(
            onPressed: () {
              // Text Button action
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Plant(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16.0), // Rounded corners
              ),
            ),
            child: Text('修改植物'),
          ),
        ],

      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal, // 水平滚动
        itemCount: 1, // 只有一个子项，用来包裹 GridView.builder
        itemBuilder: (context, _) {
          return Container(
            width: MediaQuery.of(context).size.width * 18, // 设置一个宽度来限制水平方向的滚动
            child: GridView.builder(
              scrollDirection: Axis.vertical, // 垂直滚动
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80, // 设置每个网格项的最大宽度
                crossAxisSpacing: 8, // 设置列间距
                mainAxisSpacing: 8, // 设置行间距
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                // 获取x和y的值
                String xValue = data[index]["x"];
                String yValue = data[index]["z"];

                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Print the id value when the button is pressed
                      print('Button pressed with id: ${data[index]["id"]}');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(50, 10),
                      ),
                    ),
                    child: Text(data[index]["id"].toString()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }





}

//排序先竖后恒
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('数据条'),
//     ),
//     body: ListView.builder(
//       scrollDirection: Axis.vertical, // 垂直滚动
//       itemCount: 1, // 在垂直方向只有一个子项，用来包裹 GridView.builder
//       itemBuilder: (context, _) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 18, // 设置一个高度来限制垂直方向的滚动
//           child: GridView.builder(
//             scrollDirection: Axis.horizontal, // 水平滚动
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 80, // 设置每个网格项的最大宽度
//               crossAxisSpacing: 8, // 设置列间距
//               mainAxisSpacing: 8, // 设置行间距
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               // 获取x和y的值
//               String xValue = data[index]["x"];
//               String yValue = data[index]["y"];
//
//               return Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Print the id value when the button is pressed
//                     print('Button pressed with id: ${data[index]["id"]}');
//
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RegisterPage(),
//                       ),
//                     );
//                   },
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all<Size>(
//                       Size(50, 10),
//                     ),
//                   ),
//                   child: Text(data[index]["id"].toString()),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     ),
//   );
// }



