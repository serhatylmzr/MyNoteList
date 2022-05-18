import '../../../feature/note/model/category/category_model.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_constants.dart';

class NoteCategoryManager {
  static NoteCategoryManager? _instance;
  static NoteCategoryManager get instance {
    return _instance ??= NoteCategoryManager._init();
  }

  NoteCategoryManager._init();
  final noList = CategoryModel(
      id: 1, category: CategoryText.noList, color: CategoryColors.darkGreen);
  final personal = CategoryModel(
      id: 2, category: CategoryText.personal, color: CategoryColors.red);
  final withFriends = CategoryModel(
      id: 3, category: CategoryText.withFriends, color: CategoryColors.green);
  final work = CategoryModel(
      id: 4, category: CategoryText.work, color: CategoryColors.blue);
  final errands = CategoryModel(
      id: 5, category: CategoryText.errands, color: CategoryColors.purple);

  late final List<CategoryModel> categories = [
    noList,
    personal,
    withFriends,
    work,
    errands,
  ];
}
