import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:technoprise_test/commonWidgets/text_form_field.dart';
import 'package:technoprise_test/imports.dart';

class CreateListPage extends HookConsumerWidget {
  const CreateListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    return Scaffold(
      backgroundColor: COLORBACKGROUND,
      appBar: AppBar(
        backgroundColor: COLORWHITE,
        elevation: 0,
        title: Text(
          addItem,
          style: fontSize16600,
        ),
        centerTitle: false,
        actions: <Widget>[],
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
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Container(
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
                  padding: EdgeInsets.all(AppSizes.appCustomSize(16)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            instruction,
                            style: fontSize12400.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.appHeight(
                          12,
                        ),
                      ),
                      WorkaHubTextFormField(
                        title: titleText,
                        hintText: titleLable,
                        textAlign: TextAlign.start,
                        isObsecure: false,
                        maxLines: 1,
                        controller: titleController,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        onchanged: (val) {},
                        name: 'title',
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSizes.appHeight(20),
                      ),
                      WorkaHubTextFormField(
                        title: description,
                        hintText: descriptionLable,
                        textAlign: TextAlign.start,
                        isObsecure: false,
                        maxLines: 5,
                        controller: descriptionController,
                        onchanged: (val) {},
                        name: 'description',
                        validators: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        textInputType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonWidget(
                    isOutLine: true,
                    title: cancel,
                    foregroundColor: COLORPRIMARY,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    hasMinimumSize: false,
                  ),
                  TextButtonWidget(
                    title: addItem,
                    foregroundColor: COLORWHITE,
                    backgroundColor: COLORPRIMARY,
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        var title = _formKey.currentState!.value['title'];
                        var description =
                            _formKey.currentState!.value['description'];

                        ref.read(listItemsProvider.notifier).addItems(
                              description: description,
                              title: title,
                              context: context,
                            );
                      }
                    },
                    hasMinimumSize: false,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
