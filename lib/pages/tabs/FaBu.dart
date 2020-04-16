import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class FaBuPage extends StatefulWidget {
  FaBuPage({Key key}) : super(key: key);

  @override
  _FaBuState createState() => _FaBuState();
}

class _FaBuState extends State<FaBuPage> {
  List _imageUrls=[
    "http://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584618143719&di=eebea7d907cfc50930941c412e69f997&imgtype=0&src=http%3A%2F%2Fdesk-fd.zol-img.com.cn%2Ft_s960x600c5%2Fg5%2FM00%2F02%2F04%2FChMkJlbKx_qIJpXEAAY_enwIYD8AALH7gA2YocABj-S662.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584618157711&di=e6258a2ba24014b56d61e716f1b48c2e&imgtype=0&src=http%3A%2F%2Fimg.daimg.com%2Fuploads%2Fallimg%2F191014%2F1-1910141GJ40-L.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584618138042&di=c9209d1167e5659619e2afab32b1a25f&imgtype=0&src=http%3A%2F%2Ffile.mumayi.com%2Fforum%2F201401%2F16%2F231735cfp4046206r4i705.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          children: <Widget>[
            Container(
              height:160,
              child: Swiper(
                itemCount:_imageUrls.length,
                autoplay: true,
                itemBuilder:(BuildContext context,int index){
                  return Image.network(
                    _imageUrls[index],
                    fit:BoxFit.fill,
                  );
                },
                pagination:SwiperPagination(),
            ),
            ),
          ],
        ),
    ),);
}}