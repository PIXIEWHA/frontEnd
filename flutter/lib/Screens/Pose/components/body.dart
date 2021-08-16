import 'package:flutter/material.dart';
import 'package:pixie/Screens/FirebaseApi/FirebaseApi.dart';
import 'package:pixie/Screens/FirebaseApi/FirebaseFile.dart';
import 'package:pixie/Screens/FirebaseApi/ImagePage.dart';
import 'package:pixie/Screens/Main/components/background.dart';
import 'package:pixie/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Future<String> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? account = prefs.getString('account');
    if (account != null) {
      return account;
    }
    return "";
  }

  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<FirebaseFile>> futureFiles =
        FirebaseApi.listAll('/' + getAccount().toString());
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("OpenPose 영상 확인"),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            FutureBuilder<List<FirebaseFile>>(
              future: futureFiles,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                        heightFactor: size.height * 0.1,
                        child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Center(child: Text('에러가 발생하였습니다!'));
                    } else {
                      final files = snapshot.data!;

                      return ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildHeader(files.length),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: files.length,
                                    itemBuilder: (context, index) {
                                      final file = files[index];

                                      return buildFile(context, file);
                                    },
                                  ),
                                ),
                              ]));
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        title: Text(
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ImagePage(file: file),
        )),
      );

  Widget buildHeader(int length) => ListTile(
        tileColor: kPrimaryLightColor,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.file_copy,
            color: Colors.black,
          ),
        ),
        title: Text(
          '$length Files',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      );
}
