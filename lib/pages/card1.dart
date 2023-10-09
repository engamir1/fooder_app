import 'package:flutter/material.dart';
import 'package:fooder_app/api/mock_fooderlich_service.dart';
import 'package:fooder_app/models/models.dart';
import 'package:fooder_app/theme/app_theme.dart';
import 'package:fooder_app/widgets/circle_image.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';
  @override
  Widget build(BuildContext context) {
    final mockService = MockFooderlichService();
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<ExploreRecipe> recipes = snapshot.data!.todayRecipes;
          final List<Post>? posts = snapshot.data?.friendPosts;

          // print(recipes);

          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 10),
              Text("Recipe of the day :) ",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  constraints: BoxConstraints.expand(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 300,
                  ),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          // width: 350,
                          // height: 450,

                          padding: const EdgeInsets.all(16),
                          constraints: BoxConstraints.expand(
                            width: MediaQuery.of(context).size.width * .9,
                            height: 300,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(recipes[index].backgroundImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Stack(children: [
                            Text(
                              "category",
                              style: FooderTheme.darkTextTheme.titleMedium,
                            ),
                            Positioned(
                              top: 20,
                              child: Text(
                                recipes[index].title,
                                style: FooderTheme.darkTextTheme.headlineSmall,
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              right: 0,
                              child: Text(
                                recipes[index].message,
                                style: FooderTheme.darkTextTheme.titleMedium,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 0,
                              child: Text(
                                recipes[index].authorName,
                                style: FooderTheme.lightTextTheme.titleSmall,
                              ),
                            ),
                          ]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 30);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListView.builder(
                      primary: false,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: posts?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleImage(
                                  imageProvider: AssetImage(
                                      posts![index].profileImageUrl)),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      posts[index].comment,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      "${posts[index].timestamp} mins ago ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite)),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
