import 'package:technoprise_test/imports.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listItems = ref.watch(listItemsProvider);

    return Scaffold(
      backgroundColor: COLORBACKGROUND,
      appBar: AppBar(
        backgroundColor: COLORWHITE,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            MdiIcons.menu,
            color: COLORBLACK,
          ),
          onPressed: () {},
        ),
        title: Text(
          title,
          style: fontSize16600,
        ),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButtonWidget(
              hasIcon: true,
              icon: MdiIcons.plus,
              title: newText,
              foregroundColor: COLORWHITE,
              backgroundColor: COLORPRIMARY,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateListPage()),
                );
              },
              hasMinimumSize: false,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.appCustomSize(
            24,
          ),
          horizontal: AppSizes.appCustomSize(
            16,
          ),
        ),
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            ListItemModel item = listItems[index];

            return listTileWidget(item, context, ref);
          },
        ),
      ),
    );
  }
}

listTileWidget(ListItemModel item, BuildContext context, WidgetRef ref) {
  return Container(
    margin: EdgeInsets.only(bottom: AppSizes.appHeight(12)),
    decoration: BoxDecoration(
      color: COLORWHITE,
      borderRadius: BorderRadius.circular(
        AppSizes.appRadius(16),
      ),
      border: Border.all(
        color: COLORBORDER,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSizes.appWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: fontSize14600,
                ),
              ),
              InkWell(
                onTap: () {
                  ref.read(listItemsProvider.notifier).remove(item);
                },
                child: Icon(
                  MdiIcons.trashCan,
                  color: COLORRED,
                  size: AppSizes.appCustomSize(15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.appHeight(8),
          ),
          Text(
            item.description,
            style: fontSize12400,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}
