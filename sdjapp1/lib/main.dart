import 'package:flutter/material.dart';
import 'package:sdjapp1/pages/TrbPage.dart';
import 'pages/OsjPage.dart';
import 'pages/DtbPage.dart';
import 'pages/TtkPage.dart';
import 'pages/UsjPage.dart';
import 'pages/KykPage.dart';
import 'pages/UmsPage.dart';
import 'pages/AbhPage.dart';
import 'pages/stjPage.dart';
import 'pages/BkkPage.dart';
import 'pages/KmsPage.dart';
import 'pages/GgoPage.dart';
import 'pages/TrbPage.dart';
import 'pages/AmmPage.dart';
import 'pages/TedPage.dart';
import 'pages/MfiPage.dart';
import 'pages/Sytpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> Osaka_Image = [
    'https://jice.homemate.co.jp/isc/castle/shiro-sanpo/201912_008_00.jpg', 
    //大阪城
    'https://static.gltjp.com/glt/data/article/21000/20444/20230926_164401_803da030_w1920.webp', 
    //道頓堀
    'https://content.linktivity.io/supplier-link/tsutenkaku-osaka/8NXZX_b1953dc8-f452-4c48-a2f2-10448d73bcfe.jpg',
    //通天閣
    'https://img.cooljapan-videos.com/r/1200x799/files/article_images/3aa13b36ca819cf560ebfe07d6967009.jpg', 
    //USJ
    'https://static.retrip.jp/article/113313/images/113313c1b799e3-5a32-4a5e-aafa-5c26916bc32b_m.jpg', 
    //海遊館
    'https://th.bing.com/th/id/R.65f44cd876e6eef5371ef3cd744b0474?rik=e4kT%2f3gpZS6yWg&riu=http%3a%2f%2fblog.osakanight.com%2fimg%2fabeno_harukas201209_03.jpg&ehk=F%2b49JKtUnMVnCadA0na1XaMMzNJyXG7bQQt%2fnOZTfGw%3d&risl=&pid=ImgRaw&r=0', 
    //あべのハルカス
    'https://www.nippon.com/ja/ncommon/contents/views/30566/30566.jpg',
    //梅田スカイビル
   'https://www.miyakohotels.ne.jp/datas/cache/images/2022/03/03/630x2048_ea1e9d427fb5664c32c517a73e421e58_d172d7eb327d2d2f376f4cd31c53d56ddd58672a.jpg',
    //四天王寺
    'https://img-cdn.guide.travel.co.jp/article/1114/36308/36D8310843914E09AB1594998DF0C229_L.jpg',
    //万博記念公園
    'https://thumb.photo-ac.com/cc/ccee892b2adb62a9574a0fe26162fb32_w.jpeg',
    //黒門市場
    '',
    //グラングリーン大阪
    '',
    //チームラボボタニカルガーデン 大阪
    '',
    //アメリカ村
    '',
    //天王寺動物園
    '',
    //百舌鳥・古市古墳群
    '',
    //住吉大社
 
  ];

  List<String> Osaka_Name = [
    '大阪城',
    '道頓堀',
    '通天閣',
    'USJ',
    '海遊館',
    'あべのハルカス',
    '梅田スカイビル',
    '四天王寺',
    '万博記念公園',
    '黒門市場',
    'グラングリーン大阪',
    'チームラボ ボタニカルガーデン 大阪(長居)',
    'アメリカ村',
    '天王寺動物園',
    '百舌鳥・古市古墳群',
    '住吉大社',
  ];

  List<Widget> Osaka_page = [
    const OsjPage(),
    const DtbPage(),
    const TtkPage(),
    const UsjPage(),
    const KykPage(),
    const AbhPage(),
    const UmsPage(),
    const StjPage(),
    const BkkPage(),
    const KmsPage(),
    const GgoPage(),
    const TrbPage(),
    const AmmPage(),
    const TedPage(),
    const MfiPage(),
    const SytPage(),
  ];

  void sortByName() {
    final combined = List.generate(
      Osaka_Name.length,
      (i) => {
        'name': Osaka_Name[i],
        'image': Osaka_Image[i],
        'page': Osaka_page[i],
      },
    );

    combined.sort(
      (a, b) =>
          (a['name'] as String).compareTo(b['name'] as String),
    );

    setState(() {
      for (int i = 0; i < combined.length; i++) {
        Osaka_Name[i] = combined[i]['name'] as String;
        Osaka_Image[i] = combined[i]['image'] as String;
        Osaka_page[i] = combined[i]['page'] as Widget;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('大阪観光リスト'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            tooltip: '名前順',
            onPressed: sortByName,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(
          Osaka_Name.length,
          (index) {
            String imageUrl = Osaka_Image[index];
            String name = Osaka_Name[index];
            Widget page = Osaka_page[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 60),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => page,
                        ),
                      );
                    },
                    child: const Text('詳細'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

      