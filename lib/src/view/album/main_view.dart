import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_memorable/src/model/album.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/src/view/album/widget/album_bottom_sheet.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Album> albums = [];
  @override
  void initState() {
    super.initState();
    prepareAlbumList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: context.color.primary,
        onPressed: () {},
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: context.color.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add_rounded,
            size: 30,
            color: context.color.onPrimary,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        //maintainBottomViewPadding: true,
        //bottom: true,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '앨범',
                          style: context.typo.headline2.copyWith(
                            color: context.color.text,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color:
                                        context.color.subtext.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 9,
                                  height: 9,
                                  decoration: BoxDecoration(
                                    color: context.color.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        buildCard(
                          color: context.color.subtext.withOpacity(
                            0.2,
                          ),
                          icon: Icon(Icons.add),
                        ),
                        ...List.generate(
                          albums.length,
                          (i) => buildCard(
                            album: albums[i],
                            icon: null,
                            // icon: Icon(
                            //   Icons.album_outlined,
                            //   color: context.color.primary.withOpacity(
                            //     0.6,
                            //   ),
                            // ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      '9월 25일 (수)',
                      style: context.typo.headline1.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  // GridView Starts
                  Expanded(
                    child: ContainerGrid(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: Text(
                      '9월 26일 (목)',
                      style: context.typo.headline1.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Expanded(
                    child: ContainerGrid(),
                  )
                ],
              ),
            ),

            // AlbumBottomSheet(
            //   onGalleryPressed: () {},
            //   onCameraPressed: () {},
            //   onFilePressed: () {},
            // ),
          ],
        ),
      ),
    );
  }

  void prepareAlbumList() {
    for (int i = 0; i < 5; i++) {
      var album = Album();
      album.name = '앨범 $i';
      album.imgUrl = 'https://picsum.photos/id/$i/200/200';
      album.updated = i == 0 ? true : false;
      albums.add(album);
    }
  }

  // _buildAlbumList(BuildContext context, List<Album> albums) {
  //   return CarouselSlider.builder(
  //     itemCount: albums.length,
  //     itemBuilder: ((context, index, realIndex) =>
  //         buildAlbumCard(albums[index])),
  //     options: CarouselOptions(
  //       autoPlay: false,
  //       // disableCenter: true,
  //       //aspectRatio: 2.0,
  //       scrollDirection: Axis.horizontal,
  //       // enlargeCenterPage: false,
  //       // enableInfiniteScroll: false,
  //       initialPage: 0,
  //       // autoPlay: false,
  //       // aspectRatio: 16 / 9,
  //     ),
  //   );
  // }

  buildCard({
    Album? album,
    Color? color,
    Icon? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: color ??
                  context.color.subtext.withOpacity(
                    0.1,
                  ),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: icon,
            // child: icon ??
            //     Icon(
            //       Icons.add,
            //     ),
          ),
          const SizedBox(
            height: 7,
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                ),
                child: Text(
                  album?.name ?? '새앨범 만들기',
                  style: context.typo.subtitle1.copyWith(
                    color: context.color.text.withOpacity(0.7),
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // album?.updated ? Container(
              //   width: 4,
              //   height: 4,
              //   decoration: BoxDecoration(
              //     color: context.color.primary,
              //     shape: BoxShape.circle,
              //   ),
              // ) : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  buildAlbumCard(Album album) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 66,
                height: 66,
                // margin: const EdgeInsets.only(
                //   right: 10,
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      album.imgUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Text(
              '앨범명',
              style: context.typo.subtitle1.copyWith(
                color: context.color.text,
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerGrid extends StatelessWidget {
  const ContainerGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      crossAxisCount: 3,
      children: List.generate(
        6,
        (i) => Container(
          decoration: BoxDecoration(
            color: context.color.subtext.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      crossAxisCount: 3,
      children: List.generate(
        6,
        (i) => Container(
          decoration: BoxDecoration(
            color: context.color.subtext.withOpacity(0.1),
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/id/${i * 52}/200/200'),
              fit: BoxFit.cover,
            ),
          ),
          // margin: const EdgeInsets.only(
          //   right: 2.0,
          //   bottom: 2.0,
          // ),
          //height: MediaQuery.of(context).size.height * 0.01,
          // width: MediaQuery.of(context).size.height * 0.1,
        ),
      ),
    );
  }
}
