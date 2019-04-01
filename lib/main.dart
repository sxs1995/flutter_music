import 'package:flutter/material.dart';
import 'page/index/index.dart';
import 'global_config.dart';
import 'package:provide/provide.dart';
import 'provide/songslistprovide.dart';
import 'provide/singerlistprovide.dart';

void main() {
  var songslist = SongsListProvide();
  var singerlist = SingerListProvide();
  var providers = Providers();

  providers
    ..provide(Provider<SongsListProvide>.value(songslist))
    ..provide(Provider<SingerListProvide>.value(singerlist));

  runApp(ProviderNode(
    child: Myapp(),
    providers: providers,
  ));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Music", home: new Index(), theme: GlobalConfig.themeData);
  }
}
