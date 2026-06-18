import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: BkkPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BkkPage extends StatelessWidget {
  const BkkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("大阪城"),
      ),

      body: Column(
        children: [

          // 上側エリア
          Expanded(
            flex: 5,
            child: Stack(
              children: [

                // 地図エリア
                Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text(
                      "地図",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),

                // 右上ボタン
                Positioned(
                  top: 20,
                  right: 20,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          
                          //下に内容をできるようにする

                        },
                        child: const Text("詳細"),
                      ),

                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {

                          //下に内容を表示できるようにする

                        },
                        child: const Text("編集"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 下側説明エリア
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
              child: const Text(
                "ここに観光地の説明や防災情報を表示",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}