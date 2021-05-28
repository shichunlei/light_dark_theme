import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'chinese': 'Chinese',
          'german': 'German',
          'english': 'English',
          'changeLang': 'Change language（@language）',
          'changeTheme': 'Change theme',
          'system': "Follow system",
          'light': "light",
          'dark': "dark",
        },
        'de_DE': {
          'hello': 'Hallo Welt',
          'chinese': 'Chinesisch',
          'english': 'Englisch',
          'german': 'Deutsche',
          'changeLang': 'Sprache ändern（@language）',
          'changeTheme': 'Thema ändern',
          'system': "Follow-System",
          'light': "Licht",
          'dark': "dunkel",
        },
        'zh_CN': {
          'hello': '你好世界',
          'chinese': '中文',
          'english': '英文',
          'german': '德语',
          'changeLang': '切换语言（@language）',
          'changeTheme': '切换主题',
          'system': "跟随系统",
          'light': "日间模式",
          'dark': "暗黑模式",
        }
      };
}
