import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../../main.dart';
import '../../mc_router.dart';

// GetX改造步骤2：创建controller，继承自GetXController
class MinePageController extends GetxController {
  // GetX改造步骤3：给变量值添加.obs
  var _backgroundUrl = Assets.image.defaultPhoto.path.obs;
  var _avatarUrl = Assets.image.avatar.path.obs;

  String get backgroundUrl => _backgroundUrl.value;

  set backgroundUrl(String url) => _backgroundUrl.value = url;

  String get avatarUrl => _avatarUrl.value;

  set avatarUrl(String url) => _avatarUrl.value = url;

  var _name = '看网课自学flutter中'.obs;
  var _uid = '18862603095'.obs;

  String get name => _name.value;

  String get uidDesc => '手机号码：${_uid.value}';

  //模拟网络拉取
  String get likeCount => '21万';

  String get focusCount => '1234';

  String get followCount => '4321';

  Future<void> onTapBackground() async {
    var fileUrl = await router.push(name: MCRouter.photoPicker, arguments: {MCRouter.key_url: backgroundUrl});

    // 增加类型判断
    if (fileUrl is String) {
      backgroundUrl = fileUrl;
    }
  }

  Future<void> onTapAvatar() async {
    var fileUrl = await router.push(name: MCRouter.photoPicker, arguments: {MCRouter.key_url: avatarUrl});

    // 增加类型判断
    if (fileUrl is String) {
      avatarUrl = fileUrl;
    }
  }
}
