import 'package:blog_application/article.dart';
import 'package:blog_application/carousel/carousel_slider.dart';
import 'package:blog_application/data.dart';
import 'package:blog_application/gen/assets.gen.dart';
import 'package:blog_application/gen/fonts.gen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, Mohammad!",
                        style: themeData.textTheme.subtitle1,
                      ),
                      Assets.img.icons.notification.image(width: 32,height: 32)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                  child: Text(
                    "Explore today's",
                    style: themeData.textTheme.headline4,
                  ),
                ),
                _StoryList(stories: stories, themeData: themeData),
                const SizedBox(height: 16),
                const _CategoryList(),
                const _PostList(),
                const SizedBox(
                  height: 32,
                )
              ],
            )),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
            category: categories[realIndex],
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            initialPage: 0,
            scrollPhysics: const BouncingScrollPhysics(),
            disableCenter: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;

  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 24,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 20, color: Color(0xaa0d253c))
              ]),
            ),
          ),
          Positioned.fill(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Color.fromARGB(255, 12, 34, 54),
                        Colors.transparent
                      ])),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(32)),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
    required this.themeData,
  }) : super(key: key);

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: stories.length,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final story = stories[index];

          return _StoryItem(story: story, themeData: themeData);
        },
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({
    Key? key,
    required this.story,
    required this.themeData,
  }) : super(key: key);

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${story.iconFileName}',
                    width: 24,
                    height: 24,
                  ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.name,
            style: themeData.textTheme.bodyText2,
          )
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376Aed),
            Color(0xff49b0e2),
            Color(0xff9cecfb),
          ])),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: _profileImageStory(),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        color: const Color(0xff7b8bb2),
        dashPattern: const [8, 3],
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImageStory(),
        ),
      ),
    );
  }

  Widget _profileImageStory() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest News', style: Theme.of(context).textTheme.headline5),
              TextButton(
                onPressed: () {},
                child: const Text("More"),
              )
            ],
          ),
        ),
        ListView.builder(
          itemCount: posts.length,
          itemExtent: 141,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostItem(post: post);
          },
        )
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArticleScreen()))),
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                color: Color(
                  0x1a5282ff,
                ))
          ],
        ),
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/img/posts/small/${post.imageFileName}',width: 120,),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                        fontFamily: FontFamily.avenir,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff376aed)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(post.title, style: Theme.of(context).textTheme.subtitle2),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.likes,
                          style: Theme.of(context).textTheme.bodyText2),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        CupertinoIcons.clock,
                        size: 16,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.time,
                          style: Theme.of(context).textTheme.bodyText2),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          post.isBookmarked
                              ? CupertinoIcons.bookmark_fill
                              : CupertinoIcons.bookmark,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
