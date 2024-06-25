# 原生和flutter混合项目 
flutter以module的形式引入android项目


# 环境坑点
pub cache目录冲突
Could not create task ‘:flutter_plugin_xxxxxx:generateDebugUnitTestConfig’. this and base files have different roots:
修改默认的pub cache目录 环境变量系统变量中修改 变量PUB_CACHE 值E:abcpub 
