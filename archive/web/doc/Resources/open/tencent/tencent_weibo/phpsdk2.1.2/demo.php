<?php
/**
 * 此为PHP-SDK 2.0 的一个使用Demo,用于流程和接口调用演示
 * 请根据自身需求和环境进相应的安全和兼容处理，勿直接用于生产环境
 */
error_reporting(0);
require_once './Config.php';
require_once './Tencent.php';

OAuth::init($client_id, $client_secret);
Tencent::$debug = $debug;

//打开session
session_start();
header('Content-Type: text/html; charset=utf-8');

if ($_SESSION['t_access_token'] || ($_SESSION['t_openid'] && $_SESSION['t_openkey'])) {//用户已授权
    echo '<pre><h3>已授权</h3>用户信息：<br>';
    //获取用户信息
    $r = Tencent::api('user/info');
    print_r(json_decode($r, true));
    echo '</pre>';
    // 部分接口的调用示例
    /**
     * 发表图片微博
     * pic参数后跟图片的路径,以表单形式上传的为 : $_FILES['pic']['tmp_name']
     * 服务器目录下的文件为: dirname(__FILE__).'/logo.png'
     * /
    $params = array(
        'content' => '测试发表一条图片微博'
    );
    $multi = array('pic' => dirname(__FILE__).'/logo.png');
    $r = Tencent::api('t/add_pic', $params, 'POST', $multi);
    echo $r;
    
    /**
     * 发表图片微博
     * 如果图片地址为网络上的一个可用链接
     * 则使用add_pic_url接口
     * /
    $params = array(
        'content' => '以链接形式发表一条图片微博',
        'pic_url' => 'http://mat1.gtimg.com/www/iskin960/qqcomlogo.png'
    );
    $r = Tencent::api('t/add_pic_url', $params, 'POST');
    echo $r;
    */
} else {//未授权
    $callback = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];//回调url
    if ($_GET['code']) {//已获得code
        $code = $_GET['code'];
        $openid = $_GET['openid'];
        $openkey = $_GET['openkey'];
        //获取授权token
        $url = OAuth::getAccessToken($code, $callback);
        $r = Http::request($url);
        parse_str($r, $out);
        //存储授权数据
        if ($out['access_token']) {
            $_SESSION['t_access_token'] = $out['access_token'];
            $_SESSION['t_refresh_token'] = $out['refresh_token'];
            $_SESSION['t_expire_in'] = $out['expires_in'];
            $_SESSION['t_code'] = $code;
            $_SESSION['t_openid'] = $openid;
            $_SESSION['t_openkey'] = $openkey;
            
            //验证授权
            $r = OAuth::checkOAuthValid();
            if ($r) {
                header('Location: ' . $callback);//刷新页面
            } else {
                exit('<h3>授权失败,请重试</h3>');
            }
        } else {
            exit($r);
        }
    } else {//获取授权code
        if ($_GET['openid'] && $_GET['openkey']){//应用频道
            $_SESSION['t_openid'] = $_GET['openid'];
            $_SESSION['t_openkey'] = $_GET['openkey'];
            //验证授权
            $r = OAuth::checkOAuthValid();
            if ($r) {
                header('Location: ' . $callback);//刷新页面
            } else {
                exit('<h3>授权失败,请重试</h3>');
            }
        } else{
            $url = OAuth::getAuthorizeURL($callback);
            header('Location: ' . $url);
        }
    }
}
