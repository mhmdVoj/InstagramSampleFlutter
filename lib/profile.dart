import 'package:blog_application/data.dart';
import 'package:blog_application/gen/assets.gen.dart';
import 'package:blog_application/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: themeData.colorScheme.background.withOpacity(0),
              title: Text('Profile'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded)),
                const SizedBox(
                  width: 32,
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 12, 32, 64),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1))
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story2
                                      .image(width: 84, height: 84)),
                              const SizedBox(
                                width:16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('@Mohamad'),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Mohamad Vejdani',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Mobile Developer',
                                      style:
                                          themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            "About me",
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Egestas purus viverra accumsan in nisl nisi Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque In egestas erat imperdiet sed euismod nisi porta lorem mollis",
                            style: themeData.textTheme.bodyText1!
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ]),
                ),
                Positioned(
                    bottom: 32,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 25,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.6))
                      ]),
                    )),
                Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff2151cd),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.w200,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                    ),
                                  ]),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Following',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5k',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Followers',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ]),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: themeData.colorScheme.primary,
                      ),
                    ))
              ],
            ),
            Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        'My Posts',
                        style: themeData.textTheme.headline6,
                      )),
                      IconButton(
                          onPressed: () {}, icon: Assets.img.icons.grid.svg()),
                      IconButton(
                          onPressed: () {}, icon: Assets.img.icons.table.svg()),
                    ],
                  ),
                ),
                for (var i = 0; i < posts.length; i++) PostItem(post: posts[i])
              ]),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
