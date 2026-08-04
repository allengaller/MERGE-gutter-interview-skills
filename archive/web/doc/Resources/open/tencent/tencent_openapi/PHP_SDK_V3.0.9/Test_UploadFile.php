<?php

/**
 * OpenAPI V3 SDK 上传文件类接口示例代码。适用于所有需要发送multipart/form-data格式的post请求的OpenAPI。

 *
 * @version 3.0.4
 * @author open.qq.com
 * @copyright © 2012, Tencent Corporation. All rights reserved.
 * @History:
 *               3.0.4 | coolinchen | 2012-09-07 10:20:12 | initialization
 */


require_once 'OpenApiV3.php';

// 应用基本信息
$appid = 100657839;
$appkey = 'b96b85196a04ff2ef08707f43979db15';

// OpenAPI的服务器IP 
// 最新的API服务器地址请参考wiki文档: http://wiki.open.qq.com/wiki/API3.0%E6%96%87%E6%A1%A3 
$server_name = '119.147.19.43';


// 用户的OpenID/OpenKey
$openid = 'E098C1E975A2459E534B48FB3224CFB6';
$openkey = '05219DB6D7C04CA0B3F01A51D32635E3';

// 所要访问的平台, pf的其他取值参考wiki文档: http://wiki.open.qq.com/wiki/API3.0%E6%96%87%E6%A1%A3 
$pf = 'tapp';


$sdk = new OpenApiV3($appid, $appkey);
$sdk->setServerName($server_name);

$ret = add_weibo_pic($sdk, $openid, $openkey, $pf);
print_r("===========================\n");
print_r($ret);

/**
 * 发表带图片的微博
 *
 * @param object $sdk OpenApiV3 Object
 * @param string $openid openid
 * @param string $openkey openkey
 * @param string $pf 平台
 * @return array 微博接口调用结果
 */
function add_weibo_pic($sdk, $openid, $openkey, $pf)
{
	$params = array(
		'openid' => $openid,
		'openkey' => $openkey,
		'pf' => $pf,
		'content'=>"图片描述。。@xxx",
	);
	
	$array_files	= array();
	$array_files['pic'] = '@/data/home/coolinchen/photo/test.jpg';
	$script_name = '/v3/t/add_pic_t';
	return $sdk->apiUploadFile($script_name, $params,$array_files);
}

// end of script
