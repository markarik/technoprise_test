import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technoprise_test/imports.dart';
import 'package:uuid/uuid.dart';

part 'list_items_provider.g.dart';

@Riverpod(keepAlive: true)
class ListItems extends _$ListItems {
  var uuid = Uuid();

  @override
  List<ListItemModel> build() {
    return [
      ListItemModel(
          id: uuid.v4(),
          title: "Rainforest Ecosystems",
          description:
              "Discover the rich biodiversity found in rainforests, from towering trees to unique wildlife species."),
      ListItemModel(
          id: uuid.v4(),
          title: "Space Exploration",
          description:
              "Learn about humanity's journey to explore the cosmos, from the first moon landing to Mars missions"),
      ListItemModel(
          id: uuid.v4(),
          title: "Ancient Civilizations",
          description:
              "Explore the mysteries and achievements of ancient civilizations like the Egyptians, Greeks, and Mayans."),
      ListItemModel(
          id: uuid.v4(),
          title: "Renewable Energy",
          description:
              "Understand the importance of renewable energy sources like solar, wind, and hydro power in combating climate change"),
    ];
  }

  addItems(
      {required String description,
      required String title,
      required BuildContext context}) {
    state = [
      ...state,
      ListItemModel(
        id: uuid.v4(),
        title: title,
        description: description,
      ),
    ];

    Navigator.pop(context);
  }

   void remove(ListItemModel target) {
    state = state.where((item) => item.id != target.id).toList();
  }
}
