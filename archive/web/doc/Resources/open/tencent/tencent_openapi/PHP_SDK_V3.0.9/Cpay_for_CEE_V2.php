<?php
/**
 * PHP SDK for Cpay OpenAPI--only for APPs which are hosting on CEE_V2.
 *
 * @version 3.0.6
 * @author open.qq.com
 * @copyright © 2012, Tencent Corporation. All rights reserved.
 * @ History:
 *				 3.0.6 | looklu| 2012-12-05 17:22:51 | Support POST mode to send the request. 
 */
require_once 'OpenApiV3.php';

/**
 * 支付SDK，仅适用于部署在CEE_V2上的应用，依赖于PHP_SDK_V3.0.2及以上版本。
 * @version 3.0.0
 */
 
class CloudCeePay extends OpenApiV3
{
	/**
	 * 构造函数
	 * @param string $server_ip 
	 *                       测试环境为:1.254.254.22  
	 *      				 正式环境为:openapi.tencentyun.com
	 * @param int $appid 应用的ID
	 * @param string $appkey 应用的密钥
	 */
	function __construct($server_ip,$appid, $appkey)
	{
		parent::__construct($appid,$appkey);
		parent::setServerName($server_ip);
	}

	
	/**
	 * 执行支付API调用，返回结果数组
	 *
	 * @param array $params 调用支付API时带的参数 参考http://wiki.open.qq.com/wiki/v3/pay/buy_goods
	 * @return array 结果数组
	 */
	public function buyGoods($params)
	{
		$cee_extend=getenv("CEE_DOMAINNAME").'*'.getenv("CEE_VERSIONID").'*'.getenv("CEE_WSNAME");
		$params["cee_extend"]=$cee_extend;
		$ret = parent::api('/v3/pay/buy_goods',$params,'post','https');
		return $ret;
	}
}

// end of script
