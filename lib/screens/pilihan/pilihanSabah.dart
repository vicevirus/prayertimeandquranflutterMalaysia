
import 'package:waktusolatimprovised/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:waktusolatimprovised/menu.dart';
import 'package:waktusolatimprovised/screens/loadingpages/loading.dart';
import 'package:waktusolatimprovised/components/easyBadgeCard.dart';
import 'package:waktusolatimprovised/components/sliderightransition.dart';

class PilihanSabah extends StatefulWidget {
  @override
  PilihanSabahState createState() => PilihanSabahState();
}

class PilihanSabahState extends State<PilihanSabah> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, '/');
      },
          child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: MenuTitle(
              title: 'Pilihan Kawasan',
            ),
          ),
          drawer: Durawa(),
          backgroundColor: kalerTema,
          body: Container(
            child: Center(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return TempatPilihanSabah(
                  tempat: '${lokasisabah[index]}',
                  page: LoadingPage(
                    tempatDipilih: kodsabah[index],
                    nextroute: '/SabahPilihan',
                  ),
                  );
                },
                itemCount: kodsabah.length,
              ),
            ),
          )),
    );
  }
}


class TempatPilihanSabah extends StatelessWidget {
  final String tempat;
  final page;
  const TempatPilihanSabah({Key key, this.tempat, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SlideRightRoute(page: this.page));
      },
      child: EasyBadgeCard(
        rightBadge: sabahColour,
        title: this.tempat,
        suffixIcon: Icons.chevron_right,
        suffixIconColor: Colors.green[500],
      ),
    );
  }
}