import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/data/lcu.dart';
import 'package:lol_auto_accept/data/model/champions/champion.dart';
import 'package:lol_auto_accept/data/model/hero_info.dart';

const double _pagePadding = defaultPadding / 4;

class ChoseHeroController extends GetxController {


  final RxList<HeroInfo> selectList;

  ChoseHeroController(this.selectList);



  /// NetworkImageSSL 配置
  String get baseUrl => Get.find<LcuApi>().httpClient.baseUrl!;

  Map<String, String> get headers => Get.find<LcuApi>().customHeaders;

  /// 从客户端获取英雄列表，并生成列表
  Future<List<Widget>> get heroList async {
    List<Widget> res = List.empty(growable: true);
    var heroes = await Get.find<LcuApi>().getHero().then((value) {
      return value;
    }).onError((error, stackTrace) {
      // TODO
      return Future.value(List.empty());
    });

    var ownedHeroes = await Get.find<LcuApi>().getOwnedHero().then((value){
      Map<int,Champion> result = {};
      for (var item in value) {
        result[item.id] = item;
      }
      return result;
    }).onError((error, stackTrace) {
      // TODO
      return Future.value({});
    });
    heroes.removeWhere((element) => !ownedHeroes.containsKey(element.id));

    for (var element in heroes) {
      var item = GestureDetector(
        /// 点击时添加到列表
        onTap: () {
          var i = selectList.indexWhere(
            (element) {
              return element.id == -1;
            },
          );
          if (i != -1) {
            selectList[i] = element;
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.blue,
                child: Image(
                    image: NetworkImageSSL(baseUrl + element.squarePortraitPath,
                        headers: headers)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                element.name,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
      res.add(item);
    }
    return res;
  }

  get getSelectedList => selectList;

  void removeSelected(HeroInfo element) {
    var index = selectList.indexOf(element);
    selectList[index] = HeroInfo.fromJsonMap(nonHero);
  }
}

@immutable
class ChoseHero extends StatelessWidget {
  late ChoseHeroController controller;

  ChoseHero(RxList<HeroInfo> list,{super.key, title}) {
    if (title == null) {
      controller = Get.put<ChoseHeroController>(ChoseHeroController(list));
    }
    else {
      controller = Get.put<ChoseHeroController>(ChoseHeroController(list),tag: title);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: appBarHeight,
        ),
        SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Text("chose_hero".tr,
                      style: const TextStyle(fontSize: 38)),
                ))
              ],
            )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                            child: FutureBuilder(
                                future: controller.heroList,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      padding: const EdgeInsets.fromLTRB(defaultPadding,defaultPadding,0,defaultPadding),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: GridView.count(
                                        crossAxisCount: 10,
                                        mainAxisSpacing: 10,
                                        padding: const EdgeInsets.only(
                                            right: defaultPadding),
                                        children: [...(snapshot.data!)],
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Text("loading".tr),
                                    );
                                  }
                                })),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        SizedBox(
                          width: 80,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black26,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(_pagePadding),
                                      child: Text("selected".tr),
                                    )
                                  ],
                                ),
                                Obx(
                                  () {
                                    List<Widget> widgets =
                                        List.empty(growable: true);
                                    for (var element
                                        in controller.getSelectedList) {
                                      var item = SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Image(
                                                  image: NetworkImageSSL(
                                                      controller.baseUrl +
                                                          element
                                                              .squarePortraitPath,
                                                      headers:
                                                          controller.headers),
                                                )),
                                            element.id != -1
                                                ? Positioned(
                                                    right: 0,
                                                    top: 0,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .removeSelected(
                                                                element);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: const Icon(
                                                          Icons.cancel,
                                                          color: Colors.pink,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      );
                                      widgets.add(item);
                                    }
                                    return Column(
                                      children: [...widgets],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )))
          ],
        )),
        SizedBox(
            height: appBarHeight,
            child: Row(
              children: [
                Expanded(
                    child: Center(
                  child: Text("i_love_you".tr),
                ))
              ],
            )),
      ],
    );
  }
}
