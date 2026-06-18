import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// =====================
// 地図データ
// =====================

enum PlaceType {
  tourist,
  shelter,
}

class Place {
  final String name;
  final LatLng location;
  final PlaceType type;

  const Place({
    required this.name,
    required this.location,
    required this.type,
  });
}

const List<Place> places = [
  Place(
    name: 'あべのハルカス',
    location: LatLng(34.6454, 135.5138),
    type: PlaceType.tourist,
  ),
  Place(
    name: '避難所',
    location: LatLng(34.6465, 135.5125),
    type: PlaceType.shelter,
  ),
];

// =====================
// あべのハルカス画面
// =====================

class AbhPage extends StatelessWidget {
  const AbhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('あべのハルカス'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 地図
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(34.6454, 135.5138),
                  initialZoom: 16,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: places.map((place) {
                      final color =
                          place.type == PlaceType.tourist
                              ? Colors.red
                              : Colors.blue;

                      return Marker(
                        point: place.location,
                        width: 120,
                        height: 80,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: color,
                              size: 40,
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                place.name,
                                style: const TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          // 災害情報
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange.shade100,
                    child: const Center(
                      child: Text(
                        '災害情報',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue.shade100,
                    child: const Center(
                      child: Text(
                        '詳細',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 問題ボタン
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
                child: const Text(
                  '問題',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================
// クイズ画面
// =====================

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  void select1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('正解！')),
    );
  }

  void select2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('不正解')),
    );
  }

  void select3(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('不正解')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '問題'
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.deepOrange,
              child: const Center(
                child: Text(
                  '問題画像',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '正しいものを1つ選んでください',
              style: TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => select1(context),
              child: const Text(
                '選択肢1',
                style: TextStyle(fontSize: 35),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () => select2(context),
              child: const Text(
                '選択肢2',
                style: TextStyle(fontSize: 35),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () => select3(context),
              child: const Text(
                '選択肢3',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}