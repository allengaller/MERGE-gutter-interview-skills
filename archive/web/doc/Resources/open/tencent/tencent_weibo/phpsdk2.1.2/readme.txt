【更新日志】
2012-08-01 发布PHP-SDK2.0正式版，增加RefreshToken续期授权功能。

2012-05-01 发布PHP-SDK2.0Beta版。




【功能说明】
此为腾讯微博PHP-SDKv2.0版，由  xpzhu 提供并维护，使用该SDK需开启支持ssl的php_curl扩展。如果遇到使用方面的问题或是发现BUG，请邮件联系 xp_zhu@qq.com

说明:
1.SDK里面包含什么？
  Tencent.php 核心文件，封装了最基本的授权，API请求等类
  Config.php 配置文件，请根据用户自己的需求进行修改
  demo.php 使用示例，用于演示流程和接口调用示例
  index.html 演示入口, 重复授权须关掉浏览器

2.如何使用该SDK？
  (1)修改 Config.php 填写自己的 appid 和 appkey
  (2)根据自身需要修改 demo.php，并在应用首页引入该文件
  (3)应用频道给站内应用的URL后追加对应用户的openid&openkey,该版本SDK检测到此参数时会跳过授权步骤直接去请求api
  (4)该SDK只提供最基本的功能代码，熟练的开发都可以根据自身的需要进行功能扩展

下载地址： http://open.t.qq.com/download/PHP-SDKv2.0.zip