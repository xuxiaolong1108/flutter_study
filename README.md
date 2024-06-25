# 原生和flutter混合项目 
flutter以module的形式引入android项目

# 库
cupertino_icons: ^1.0.2
dio: ^5.4.0
path_provider:  ^2.1.2
json_serializable: ^6.7.1
json_annotation: ^4.8.1
build_runner: ^2.4.8
shared_preferences: ^2.2.2
flutter_gen_runner: ^5.4.0
image_picker: ^1.0.7
get: ^4.6.6
camera: ^0.10.5+9
player:
 path: flutter_player-master
pull_to_refresh: ^2.0.0


# 环境坑点
pub cache目录冲突
Could not create task ‘:flutter_plugin_xxxxxx:generateDebugUnitTestConfig’. this and base files have different roots:
修改默认的pub cache目录 环境变量系统变量中修改 变量PUB_CACHE 值E:abcpub 
