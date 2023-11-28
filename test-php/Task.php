<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Cache;
use think\Db;
/**
 * 手机短信接口
 */
class Task extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $baseUrl = "https://webapim.doublepine.co.th/";
    protected $header = [];
	protected $COMcode='AD';//所需数据库名称的最后 2 位
	protected $USRpw = 'Admin369';
	protected $CACcode = 'MUX8DFB2BC85';
    protected $storeCode = 'MAIN';
    protected $USRcode = 'ADMIN';
// 	protected $COMcode='AD';//所需数据库名称的最后 2 位
// 	protected $USRpw = 'DFB2';
// 	protected $CACcode = 'MUX8DFB2BC85';
//     protected $storeCode = 'MAIN';
//     protected $USRcode = 'ADMIN';
	public function __construct()
	{

		if (TRUE) {
			$this->header[] = "Authorization: Bearer ". $this->getToken();
		}
		else{
			$ret = [
				'Message' => 'ERP CONNECT FAIL',
				'Success' => false,
			];
			return json_encode($ret);;
			die();
		}

	}
	public function play(){
	    $list=Db::name('task')->where('status',0)->limit(0,10)->select();
	    foreach ($list as $k=>$v){
	        //订单
	        if($v['type']==3){
	            $result=$this->pushOrder($v['pre_id']);
	        }
	         if($v['type']==1){
	            $result=$this->saveDebtor($v['pre_id']);
	        }
	         if($v['type']==2){
	            $result=$this->syncGoodsStockByOrderId($v['pre_id']);
	        }
	       if($v['type']==4){
	            $result=$this->saveAddressByid($v['pre_id']);
	        }
	        if($result){
	            echo 'Success';
	            Db::name('task')->where('id',$v['id'])->update(['status'=>1]);
	        }
	        else{
	            var_dump($result);die;
	        }
	    }
	    echo count($list);
	    
	    
	}
	public function getToken()
	{
	
		$key = 'MAC5_TOKEN_'.$this->COMcode;
		$token = Cache::get($key);
		if (!$token) {
			$url = $this->baseUrl."login/auth"; 
// 			$params = [
// 				'CACcode' =>  $this->CACcode,
// 				'USRcode' =>  $this->USRcode,
// 				'USRpw' => strtoupper(hash("sha512", $this->USRpw)),
// 				'DIcode' => 'standard',
// 			];
			$params = [
				'SecretKey1' =>  '2F37372F30342C2D7326272324232022226A3A4143222D2E291827271B19612A07385861505E0D3743104557565C636563676073772D79343233',
				'SecretKey2' =>  '2F37372F3334292C7326272324232022226A3A4143222D2E291827271B1961273738651A67241E23',
		
			];
// 			var_dump($params);die;
            // var_dump($params);DIE;
			$result = $this->curl_http_post($url, $params);
// 			var_dump($url);die;
			$result = json_decode($result, true);
// 			var_dump($result,'xxx');die;
			if (isset($result['Token'])) {
				cache::set($key,$result['Token'], 20 * 3600);
				$token = $result['Token'];
			}
			else{
			    echo 'token/error';
			}
		}
		return $token;
	}
    public function ceshi(){
//       	$params = [
// 			'CC_code' => 'AP00000012', // 客户编码
// 			'CC_nameT' => 'ทดสอบ2  ที่อยู่ยู่', //昵称
		
// 			'CC_Psales' =>'S01',
// 			'CC_tel' => '0865487551', //手机号
// 			'CC_limit' =>0, //信用額
// 			'CC_date'=>'2023/09/12',
// 			'CC_termDays' => 15, //信用天數
// 		  			"CC_add1T"=>"11 ซอย 87 แยก 1 ถนนลาดพร้าว",
// "CC_add2T"=>"แขวงคลองเจ้าคุณสิงค์  เขตวังทองหลาง ",
// "CC_add3T"=>"กรุงเทพมหานคร 10340 ",
// "CC_contactT"=>"0845541154",


// "CC_add1E"=>"88 หมู่บ้านยอด ถนนพหลโยธิน",
// "CC_add2E"=>"ตำบลลาดสวาย อำเภอลำลูกกา ",
// "CC_add3E"=>"ปทุมธานี 12520 ",
// "CC_contactE"=>"0123456789",
// 			'CC_openCN'=>1,
// 			'CC_price' => 'C', // 等级A-Z
// 		];
// 			$url = $this->baseUrl.'V3/savecode/' . $this->COMcode . '/debtor';

	   $url = $this->baseUrl.'V3/savecode/' . $this->COMcode . '/delivery-address';

		$params = [
"DC_code"=>"AP00000012",
"DC_id"=>"4",
"DC_add1"=>"41/85 ซอยรักดี ถนนแสนดี",
"DC_add2"=>"ตำบลลาดยาว อำเภอในเมือง ",
"DC_add3"=>"จังหวัดเลย 48210 ",
"DC_tel"=>"0875421688",
// 			'DC_zone' => $address['code'], // 	邮编
		];
// 		if(!empty($member['grade_name'])){
// 		  //  'CC_price' => trim($memberLevelString), // 等级A-Z
// 		  $str=trim(str_replace('Member','',$member['grade_name']));
// 		    $params['CC_price']=$str=='A+'?'C':$str;
// 		}
		var_dump($params);
// 		var_dump($url);
// 		var_dump($this->header);die;
// 		var_dump($params);die;
		$result =  $this->curl_http_post($url, $params,$this->header);
// 		var_dump($result);die;
		$result = json_decode($result, true);
var_dump($result);die;
		if ($result['Success'] ) {
		    return true;
		
		}
		return false;
    }
    public function credit($memberid='8'){
        $member=Db::name('user')->where('id',$memberid)->find();
     
		$url = $this->baseUrl.'report/' . $this->COMcode . '/calculatecustomerbalance?DEBcode='.$member['customer_no'];
		var_dump($url);
		$result =  $this->curl_http_get($url,$this->header);
// 		var_dump($result);die;
		$result = json_decode($result, true);
		var_dump($result);
		if ($result['total'] > 0) {
		    Db::name('user')->where('id',$memberid)->update(['credit'=>$result['rows'][0]['CB_limit'],'s_credit'=>$result['rows'][0]['CB_Balance']]);
		}
	
    }
    function offset($remote, $local = NULL, $now = NULL){
		if ($local === NULL)
		{
			// Use the default timezone
			$local = date_default_timezone_get();
		}
 
 
		if (is_int($now))
		{
			// Convert the timestamp into a string
			$now = date(DateTime::RFC2822, $now);
		}
 
 
		// Create timezone objects
		$zone_remote = new \DateTimeZone($remote);
		$zone_local  = new \DateTimeZone($local);
 
 
		// Create date objects from timezones
		$time_remote = new \DateTime($now, $zone_remote);
		$time_local  = new \DateTime($now, $zone_local);
 
 
		// Find the offset
		$offset = $zone_remote->getOffset($time_remote) - $zone_local->getOffset($time_local);
 
 
		return $offset;
	}
	//推送会员信息
	public function saveDebtor($member)
	{
        $member= Db::name('user a')->join('user_grade c','c.id=a.level','left')->join('shopro_sale b','b.id=a.sale_id','left')->field('a.*,b.sale_no,c.name as grade_name')->where('a.id',$member)->find();
		$url = $this->baseUrl.'V3/savecode/' . $this->COMcode . '/debtor';
		if (!$member['customer_no']) {
            $customer_no = 'AP' .sprintf("%08d",$member['id']);
		    Db::name('user')->where('id',$member['id'])->update(['customer_no'=>$customer_no]);
			$member['customer_no'] = $customer_no;
		}
		$address=Db::name('shopro_user_address')->where('user_id',$member['id'])->where('is_default',1)->find();
		if(!empty($address)){
		   $xin=$address['address'];
		   $xin1=$address['city_name'] . " " .$address['area_name'] ;
		   $xin2=$address['province_name']. " " . $address['code'];
		}
		else{
		    $xin='ประเทศไทย';
		    $xin1='';
		    $xin2='';
		}
		$now=date('Y-m-d H:i:s',$member['createtime']);
		$offset =$this->offset('Asia/Bangkok','Asia/Shanghai',$now);
	$offset=strtotime( $now )+$offset;
	$tr=date('Y-m-dH:i:s',$offset);
	$time=substr($tr,0,10);
	
	$time1=substr($tr,10,9);
		$params = [
			'CC_code' => $member['customer_no'], // 客户编码
			'CC_nameT' => $member['nickname'], //昵称
			'CC_contactT' => $member['nickname'], //个人电话
			'CC_Psales' =>empty($member['sale_no'])?'S01':$member['sale_no'] , // 销售编码
			'CC_tel' => "".$member['mobile'], //手机号
			'CC_limit' =>$member['credit'], //信用額
            // 'CC_limit' =>0, //信用額
// 			'CC_termDays' => 1, //信用天數
			'CC_termDays' => intval($member['day'])==0?1:intval($member['day']), //信用天數
			'CC_add1T'=>$xin,
			'CC_add2T'=>$xin1,
			'CC_add3T'=>$xin2,
			'CC_date'=>$time.'T'.$time1,
// 			'CC_date'=>'2023-09-18T00:00:00',
// 			date('Y-m-d H:i:s',$member['createtime']),
			'CC_openCN'=>1,
// 			'CC_price' => 'A', // 等级A-Z
		];
		if(!empty($member['grade_name'])){
		  //  'CC_price' => trim($memberLevelString), // pushOrder等级A-Z
		  $str=trim(str_replace('Member','',$member['grade_name']));
		    $params['CC_price']=$str=='A+'?'C':$str;
		}
// 		var_dump($params);
// 		var_dump($now);
// 		var_dump($url);
// 		var_dump($this->header);die;
// 		var_dump($params);die;
		$result =  $this->curl_http_post($url, $params,$this->header);
// 		var_dump($result);die;
		$result = json_decode($result, true);
// var_dump($result);die;
		if ($result['Success'] ) {
		    return true;
		
		}
		return false;
	}

// 	//代理审核推送会员信息
// 	public function saveDebtorByApplyId($id)
// 	{
// 		global $_W;
// 		return false;
// 		if (!$id) {
// 			return;
// 		}
// 		$apply = pdo_get('ewei_shop_member_level_apply',['id'=>$id]);
// 		if (!$apply) {
// 			return;
// 		}

// 		$member = m('member')->getMember($apply['openid']);
// 		if (!$member) {
// 			return;
// 		}

// 		// $address = pdo_get('ewei_shop_member_address',['openid'=>$openid]);
// 		// $sql = "select * from ".tablename('ewei_shop_member_address')." where deleted=0 and  openid=:openid and uniacid=:uniacid order by isdefault desc ,id desc limit 3";
// 		// $addressList = pdo_fetchall($sql, [':openid' => $openid, ':uniacid' => $_W['uniacid']]);



// 		$url = $this->baseUrl.'V3/savecode/' . $this->COMcode . '/debtor';

// 		if (!$member['customer_no']) {
// 			$rsn = m('member')->getMaxCustomsCode();
// 			$autoindex = $rsn['autoindex'];
// 			$customer_no =  $rsn['customer_no'];

// 			pdo_update('ewei_shop_member',['autoindex'=>$autoindex],['id'=>$member['id']]);
// 			$member['customer_no'] = $customer_no;
// 		}
// 		$memberLevelString = '';
// 		if ($apply['level_id']) {
// 			$member_level = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $apply['level_id'], ':uniacid' => $_W['uniacid']));
// 			$memberLevelString = substr($member_level['levelname'],strlen("Member "));
// 		}



// 		$params = [
// 			'CC_code' => $member['customer_no'], // 客户编码
// 			'CC_nameT' => $member['nickname'], //昵称
// 			'CC_contactT' => $member['mobile'], //个人电话
// 			'CC_Psales' => $member['sale_no'], // 销售编码
// 			// 'CC_price' => "A", // 销售编码
// 			'CC_add1T' => $apply['address'] . " " . $apply['area'] . " " . $apply['city'] . " " . $apply['province'], // 地址
// 			'CC_tel' => $member['mobile'], //手机号
// 			// 'CC_limit' => 10000, //信用額
// 			// 'CC_termDays' => 1, //信用天數
// 			// 'CC_nameE' => "AAAA", //手机号
// 			'CC_price' => trim($memberLevelString), // 等级A-Z
// 		];


// 		$result =  $this->curl_http_post($url, $params,$this->header);
// 		$result = json_decode($result, true);
// 		$data = [
// 			'uniacid'=>$_W['uniacid'],
// 			'desc'=>'推送会员openid：'.$member['openid'],
// 			'res' => $result['Success'] ? 1 : 0,
// 			'message' => $result['Message'],
// 			'createtime' => time(),
// 		];
// 		$log_id = pdo_insert('ewei_shop_mac5_log',$data);
// 		if ($result['Success'] && $log_id) {
// 			// $this->saveDeliveryAddress($openid);
// 			// pdo_update('ewei_shop_member',['erp_log_id'=>$log_id],['id'=>$member['id']]);
// 		}

// 		return $result;

// 	}

	//异步 , 会卡顿一秒
// 	public function asyncGoodsStock()
// 	{
// 		$ch = curl_init();
// 		curl_setopt($ch, CURLOPT_URL, 'http://' . $_SERVER["HTTP_HOST"]. '/web/plan.php');
// 		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// 		curl_setopt($ch, CURLOPT_TIMEOUT, 1);
// 		curl_exec($ch);
// 		curl_close($ch);
// 	}

	//同步库存
	public function syncGoodsStock()
	{
	
// 		set_time_limit(0);
// 		$list = pdo_getall('ewei_shop_goods',['uniacid'=>$_W['uniacid'],'status'=>1,'deleted'=>0]);
		$list=Db::name('shopro_goods')->where('store_type',1)->field('id,is_sku')->where('id',1242)->select();
		foreach ($list as $key => $goods) {
            // var_dump($goods);die;
			//判断是多规格还是单规格,多规格
			if ($goods['is_sku'] == 1) {
				$options=Db::name('shopro_goods_sku_price')->where('sn!=""')->where('goods_id',$goods['id'])->select();
				// var_dump($options);die;
				foreach ($options as $option) {
					$res = $this->getStock($option['sn'],$this->storeCode);
				// var_dump($res);die;
					if ($res['total'] > 0) {
					    	
						if ($res['rows'][0]['SBG_quan'] != $option['stock']) {
							$data = [
								'stock' => $res['rows'][0]['SBG_quan'],
								// 'erp_title' => $res['rows'][0]['STKdescT']
							];
						    Db::name('shopro_goods_sku_price')->where('id',$option['id'])->update($data);

						}
						else{
						
						}
					}
				}
			}
			else{
			    if(!empty($goods['sn'])){
			        	$res = $this->getStock($goods['sn'],$this->storeCode);
			        
			        	if ($res['total'] > 0) {
			        	    // 		var_dump($res);die;
                            
                            $option=Db::name('shopro_goods_sku_price')->where('goods_id',$goods['id'])->find();
                            
        					if ($res['rows'][0]['SBG_quan'] != $option['stock']) {
        						$data = [
        							'stock'=>$res['rows'][0]['SBG_quan'],
        				// 			'erp_title'=>$res['rows'][0]['STKdescT'],
        						];
        					     Db::name('shopro_goods_sku_price')->where('id',$option['id'])->update($data);
        					
        					}
        					else{
        					    
        					}
        
        				}
			        
			    }
			

			}
		}
		echo count($list);
	}

	//同步商品名称
	public function syncGoodsTitle()
	{
	    	$list=Db::name('shopro_goods')->where('store_type',1)->field('id,is_sku')->where('id',2012)->select();
		foreach ($list as $key => $goods) {
            // var_dump($goods);die;
			//判断是多规格还是单规格,多规格
			
				$options=Db::name('shopro_goods_sku_price')->where('sn!=""')->where('goods_id',$goods['id'])->select();
				// var_dump($options);die;
				foreach ($options as $option) {
					$res = $this->gettitle($option['sn'],$this->storeCode);
			     //   var_dump($res);die;
					if ($res['total'] > 0) {
					    	
						
							$data = [
								// 'stock' => $res['rows'][0]['SBG_quan'],
								'erp_title' => $res['rows'][0]['STKdescT']
							];
						    Db::name('shopro_goods_sku_price')->where('id',$option['id'])->update($data);

						
					}
				}
			
			
		}
		echo count($list);
		
	}

	//同步单商品名称
// 	public function syncGoodsTitle()
// 	{
	
// // 		set_time_limit(0);
// 		$list=Db::name('shopro_goods')->where('is_sku',0)->select();
// 		foreach ($list as $key => $goods) {
// 			$res = $this->getStock($goods['sn'],$this->storeCode);
// 			if ($res['total'] > 0) {
// 				Db::name('shopro_goods')->where('id',$goods['id'])->update(['erp_title'=>$res['rows'][0]['STKdescT']]);
	
			
// 			}
// 		}
// 		echo count($list);die;
// 	}

	//同步商品规格名称
// 	public function syncGoodsOptionsTitle()
// 	{
// // 		set_time_limit(0);
// 		$list=Db::name('shopro_goods_sku_price')->where('sn!="" and erp_title=""')->where('goods_id',1242)->limit(0,20)->select();
// // 		$list = pdo_fetchall($sql,[':uniacid'=>$_W['uniacid']]);
// 		foreach ($list as $key => $option) {
// 			//判断是多规格还是单规格,多规格
// // 			var_dump($option['sn']);die;
// 			$res = $this->getStock($option['sn'],$this->storeCode);
// // 			var_dump($res);die;
// 			if ($res['total'] > 0) {
// 				Db::name('shopro_goods_sku_price')->where('id',$option['id'])->update(['erp_title'=>$res['rows'][0]['STKdescT']]);
// 			}
// 		}
// 	}

	public function getStock($stockCode,$storeCode = '')
	{


		if (!$stockCode) {
			return;
		}


		if (!$storeCode) {
			$storeCode = $this->storeCode;
		}

		$url = $this->baseUrl.'report/' . $this->COMcode . '/stockbalancebystoregroup?StockCode='.$stockCode.'&Storegroup=WH-FG';
// 		var_dump($url);die;
		$res = $this->curl_http_get($url,$this->header);
		$res = json_decode($res, true);

		return $res;
	}
	
	public function gettitle($stockCode,$storeCode = '')
	{


		if (!$stockCode) {
			return;
		}


		if (!$storeCode) {
			$storeCode = $this->storeCode;
		}

		$url = $this->baseUrl.'report/' . $this->COMcode . '/stockbalance/'.$stockCode.'/'.$storeCode;
// 		var_dump($url);die;
		$res = $this->curl_http_get($url,$this->header);
		$res = json_decode($res, true);

		return $res;
	}

    public function sa(){
        // var_dump($this->pushOrder());
        $result=$this->pushOrder(8);
        var_dump($result);die;
    }


	//推送订单
	public function pushOrder($orderid='830')
	{
	     $orderid=Db::name('shopro_order')->where('order_sn','202302514834408001160700')->value('id');
	    
		$url = $this->baseUrl.'V3/addvoucher/' . $this->COMcode . '/saleorder';
		if (!$orderid) {
			return;
		}
	    $order=Db::name('shopro_order')->where('id',$orderid)->find();
		if (!$order) {
			return;
		}
		//$orderid=$order['id'];
        $member=Db::name('user a')->join('shopro_sale b','b.id=a.sale_id','left')->field('a.*,b.sale_no')->where('a.id',$order['user_id'])->find();
		
		$orderGoods = Db::name('shopro_order_item')->where('order_id',$orderid)->select();
		//必填参数
		if (!$this->storeCode) {
	
			return ['Success'=>false,'Message'=>'Warehouse code cannot be empty'];
		}
		
		//Edit Date 04/11/2023
		  //  var_dump(1);die;
		     //  $re=$this->saveDebtor($member['id']);
		  //  var_dump($re);die;
		     //  if($re){
		         //  if(!$member['customer_no']){
		             //  $member=Db::name('user a')->join('shopro_sale b','b.id=a.sale_id','left')->field('a.*,b.sale_no')->where('a.id',$order['user_id'])->find();  
		         //  }
		        
		    //   }
		     //  else{
		        	 //  return ['Success'=>false,'Message'=>'Customer code cannot be empty'];
		     //  }
		    
		// 		
		
		if(empty($order['erp_addressid'])){
		    $resa=Db::name('shopro_order')->where('user_id',$order['user_id'])->where('province_name',$order['province_name'])->where('city_name',$order['city_name'])->where('area_name',$order['area_name'])->where('address',$order['address'])->where('code',$order['code'])->where('erp_addressid>0')->find();
		    if(empty($resa)){
		        $res=$this->saveAddressByid($order['address_id'],$orderid);
        		if($res===false){
        		  return ['Success'=>false,'Message'=>'address_id cannot be empty'];
        		}
        		$order['erp_addressid']=$res;  
		    }
		    else{
		        $order['erp_addressid']=$resa['erp_addressid'];
		        Db::name('shopro_order')->where('id',$orderid)->update(['erp_addressid'=>$resa['erp_addressid']]);
		    }
		    
		  
		}
		
		$date=date('Ymd');
		$date=substr($date,2,6);
		$rtas=Db::name('num')->where('id',1)->find();
		if($rtas['time']!=$date){
		    $rtas['sort']=0;
		    Db::name('num')->where('id',1)->update(['sort'=>1,'time'=>$date]);
		}
		else{
		     Db::name('num')->where('id',1)->setInc('sort',1);
		}
		$sn='SH'.$date.'-'.sprintf('%05d',$rtas['sort']+1);
		$count = count($orderGoods);

		$discFT = ($order['coupon_fee'])==0? round($order['total_amount']  ,2) : round(($order['total_amount'] - $order['coupon_fee']) ,2); // Edit Date 04/11/2023  Conditions for using the discount Subtract from the purchase amount

		$params = [
			'hrows'=>[
				'MH_date' => date("Y/m/d H:i:s",$order['paytime']), // 日期 1
				'MH_type' => "PS", //
				'MH_vnumber' => $sn, // 订单号
				'MH_process' => 5, //
				'MH_supcus' => $member['customer_no'], // 客户编码 3
				'MH_noItems'=>$count ,//商品数量
				'MH_noTerms'=> 1,  // Edit Date 04/11/2023 Number of credit terms
				'MH_vatRate' => 7, // 税率 10
				'MH_vatTotal' =>  intval($order['coupon_fee'])==0? round($discFT * 7 / 107 ,2) : round(round($discFT * 7 / 107,3),2), // 税 10
				'MH_netTotal' => $order['total_amount'], // 税 10
				'MH_status' => 15, // 6 // Edit Date 04/11/2023  Document status (15:New APP DP) // (98:Cancel)
				'MH_per' => $member['sale_no'], // 销售编码 6
				'MH_site' => $order['erp_addressid'], // 地址 6
				'MH_deldate' => date("Y/m/d",strtotime("+".$member['day']." days",strtotime(date("Y/m/d",$order["paytime"])))), // Edit Date 04/11/2023 Due Date delivery
				'MH_totalCOG'=>$order['pay_fee'],//金额
				// 'MH_discLsum' => $order['discountprice'] + $order['deductenough'], // 折扣
				"MH_discT1" => intval($order['coupon_fee'])==0?0:round($order['coupon_fee'] * 100 / $order['total_amount'],6), // Edit Date 04/11/2023 Discount Percentage line 1 on the left
				"MH_discF1" => intval($order['coupon_fee'])==0?0:$order['coupon_fee'],  // Edit Date 04/11/2023 Discount integer line 1 on the right
				"MH_discT2" =>  intval($order['coupon_fee'])==0? round(round($discFT * 7 / 107 ,2) * 100 / round($discFT ,6),6) : round(round(round($discFT * 7 / 107,3),2) * 100 /  round($discFT,2),6), // Edit Date 04/11/2023 Discount Percentage line 2 on the left
				"MH_discF2" =>  intval($order['coupon_fee'])==0? round($discFT * 7 / 107 ,2) : round(round($discFT * 7 / 107,3),2), // Edit Date 04/11/2023 Discount integer line 2 on the right
				'MH_flow' => 0, //
				'MH_cur' => 0, //
				'MH_Note' => $order['remark'], // 备注 7
				'MH_cnect' => 33, //  10
			],
			'erows'=>[ // Edit Date 04/11/2023
				'ME_date'=> date("Y/m/d H:i:s",$order['paytime']), 
				'ME_type'=> "PS",
				'ME_vnumber'=> $order['order_sn'], // 订单号
				'ME_supcus'=> $member['customer_no'],
				'ME_termCX'=> $member['day']."|", // Edit Date 04/11/2023 Number Day Due Date
				'ME_termPX'=> "100|", // Edit Date 04/11/2023 Payment Percentage
				'ME_termAX'=> $order['total_amount']."|", // Net amount Or NetTotal
				'ME_termDX'=>  date("d/m/Y",strtotime("+".$member['day']." days",strtotime(date("Y/m/d",$order["paytime"]))))."|",  // Edit Date 04/11/2023 Payment Due Date
				'ME_cashRec'=> 0, // Edit Date 04/11/2023 Amount received in cash
				'ME_ccRec'=> $order['total_amount'], // Edit Date 04/11/2023 The amount received is on credit or check
			],
			'krows'=>[
				'MK_date'=>date("Y/m/d H:i:s",$order['paytime']),
				'MK_name'=>$order['consignee'],
				'MK_addr'=>$order['address'].' '.$order['area_name'].' '.$order['city_name'].' '.$order['province_name'].' '.$order['code'],
				'MK_tel'=>"".$order['phone'],
			],


		];
		$lrows = [];
// 	var_dump(1);die;
        //  var_dump($orderGoods);die;
		foreach ($orderGoods as $index=>$og) {
// 			$goods = pdo_get('ewei_shop_goods', ['id' => $og['goodsid']]);
// var_dump($og);die;
            $goods=Db::name('shopro_goods_sku_price')->where('id',$og['goods_sku_price_id'])->find();
            if(empty($goods['sn'])){
                // var_dump(2);die;
                return ['Success'=>false,'Message'=>'Product ID cannot be empty'];
            }
//   var_dump(1);die;
			$stk =$goods['sn'];
			$erp_title = $goods['erp_title'];
			if(empty($erp_title)){
			    return ['Success'=>false,'Message'=>'没有同步erp商品名称'];
			}
			$lrData = [
				'ML_date' => date("Y/m/d H:i:s",$order['paytime']),
				'ML_type' => "PS",
				'ML_vnumber' => $order['order_sn'],
				'ML_per' => $member['sale_no'],
				'ML_supcus' => $member['customer_no'],
				'ML_stk' => $stk, //商品库存编码 2
				'ML_sto' => $this->storeCode, //仓库编码
				'ML_item' => $index + 1, //序号
				'ML_quan' => $og['goods_num'], //数量 4
				'ML_cog' => $og['pay_price'],// 总金额 6
				'ML_netL' => $og['pay_price'],//  总金额含税 6
				'ML_cut' => 1,//  是否减库存 6
				'ML_unit' => "PCS", //单位 4
				'ML_des' => $erp_title, // 4
				'ML_addcost' => 0, // 4
				'ML_deldate' => date("Y/m/d",strtotime("+".$member['day']." days",strtotime(date("Y/m/d",$order["paytime"])))), // 4 // Edit Date 04/11/2023 Due Date delivery
				// 'ML_uname' => "ชิ้น", //单位 4
				'ML_uprice' => $og['goods_price'] , // 单价 5
				// 'ML_upriceP' => round($og['realprice'] / $og['total'],2), // 单价 5
			];
			$lrows[] = $lrData;
		}
// 		var_dump($lrData);die;
		$params['lrows'] = $lrows;
	var_dump($params);
		$json = json_encode($params);
		$result =  $this->curl_http_post($url, $params,$this->header);
		$result = json_decode($result, true);
    var_dump($result);die;
		 if ($result['Success']) {
		     
		     return 'true';
		
		 }
		 return 'false';
// 		return $result;

	}

    
	public function CancelOrder($orderid='830')
	{
	     $orderid=Db::name('shopro_order')->where('order_sn','202302514834408001160700')->value('id');
	    
		$url = $this->baseUrl.'V3/addvoucher/' . $this->COMcode . '/saleorder';
		if (!$orderid) {
			return;
		}
	    $order=Db::name('shopro_order')->where('id',$orderid)->find();
		if (!$order) {
			return;
		}
		//$orderid=$order['id'];
        $member=Db::name('user a')->join('shopro_sale b','b.id=a.sale_id','left')->field('a.*,b.sale_no')->where('a.id',$order['user_id'])->find();
		
		$orderGoods = Db::name('shopro_order_item')->where('order_id',$orderid)->select();
		//必填参数
		if (!$this->storeCode) {
	
			return ['Success'=>false,'Message'=>'Warehouse code cannot be empty'];
		}
		
		//Edit Date 04/11/2023
		  //  var_dump(1);die;
		     //  $re=$this->saveDebtor($member['id']);
		  //  var_dump($re);die;
		     //  if($re){
		         //  if(!$member['customer_no']){
		             //  $member=Db::name('user a')->join('shopro_sale b','b.id=a.sale_id','left')->field('a.*,b.sale_no')->where('a.id',$order['user_id'])->find();  
		         //  }
		        
		    //   }
		     //  else{
		        	 //  return ['Success'=>false,'Message'=>'Customer code cannot be empty'];
		     //  }
		    
		// 		
		
		if(empty($order['erp_addressid'])){
		    $resa=Db::name('shopro_order')->where('user_id',$order['user_id'])->where('province_name',$order['province_name'])->where('city_name',$order['city_name'])->where('area_name',$order['area_name'])->where('address',$order['address'])->where('code',$order['code'])->where('erp_addressid>0')->find();
		    if(empty($resa)){
		        $res=$this->saveAddressByid($order['address_id'],$orderid);
        		if($res===false){
        		  return ['Success'=>false,'Message'=>'address_id cannot be empty'];
        		}
        		$order['erp_addressid']=$res;  
		    }
		    else{
		        $order['erp_addressid']=$resa['erp_addressid'];
		        Db::name('shopro_order')->where('id',$orderid)->update(['erp_addressid'=>$resa['erp_addressid']]);
		    }
		    
		  
		}
		
		$date=date('Ymd');
		$date=substr($date,2,6);
		$rtas=Db::name('num')->where('id',1)->find();
		if($rtas['time']!=$date){
		    $rtas['sort']=0;
		    Db::name('num')->where('id',1)->update(['sort'=>1,'time'=>$date]);
		}
		else{
		     Db::name('num')->where('id',1)->setInc('sort',1);
		}
		$sn='SH'.$date.'-'.sprintf('%05d',$rtas['sort']+1);
		$count = count($orderGoods);

		$discFT = ($order['coupon_fee'])==0? round($order['total_amount']  ,2) : round(($order['total_amount'] - $order['coupon_fee']) ,2); // Edit Date 04/11/2023  Conditions for using the discount Subtract from the purchase amount

		$params = [
			'hrows'=>[
				'MH_date' => date("Y/m/d H:i:s",$order['paytime']), // 日期 1
				'MH_type' => "PS", //
				'MH_vnumber' => $sn, // 订单号
				'MH_process' => 5, //
				'MH_supcus' => $member['customer_no'], // 客户编码 3
				'MH_noItems'=>$count ,//商品数量
				'MH_noTerms'=> 1,  // Edit Date 04/11/2023 Number of credit terms
				'MH_vatRate' => 7, // 税率 10
				'MH_vatTotal' =>  intval($order['coupon_fee'])==0? round($discFT * 7 / 107 ,2) : round(round($discFT * 7 / 107,3),2), // 税 10
				'MH_netTotal' => $order['total_amount'], // 税 10
				'MH_status' => 98, // 6 // Edit Date 04/11/2023  Document status (15:New APP DP) // (98:Cancel)
				'MH_per' => $member['sale_no'], // 销售编码 6
				'MH_site' => $order['erp_addressid'], // 地址 6
				'MH_deldate' => date("Y/m/d",strtotime("+".$member['day']." days",strtotime(date("Y/m/d",$order["paytime"])))), // Edit Date 04/11/2023 Due Date delivery
				'MH_totalCOG'=>$order['pay_fee'],//金额
				// 'MH_discLsum' => $order['discountprice'] + $order['deductenough'], // 折扣
				"MH_discT1" => intval($order['coupon_fee'])==0?0:round($order['coupon_fee'] * 100 / $order['total_amount'],6), // Edit Date 04/11/2023 Discount Percentage line 1 on the left
				"MH_discF1" => intval($order['coupon_fee'])==0?0:$order['coupon_fee'],  // Edit Date 04/11/2023 Discount integer line 1 on the right
				"MH_discT2" =>  intval($order['coupon_fee'])==0? round(round($discFT * 7 / 107 ,2) * 100 / round($discFT ,6),6) : round(round(round($discFT * 7 / 107,3),2) * 100 /  round($discFT,2),6), // Edit Date 04/11/2023 Discount Percentage line 2 on the left
				"MH_discF2" =>  intval($order['coupon_fee'])==0? round($discFT * 7 / 107 ,2) : round(round($discFT * 7 / 107,3),2), // Edit Date 04/11/2023 Discount integer line 2 on the right
				'MH_flow' => 0, //
				'MH_cur' => 0, //
				'MH_Note' => $order['remark'], // 备注 7
				'MH_cnect' => 33, //  10
			],
			'erows'=>[ // Edit Date 04/11/2023
				'ME_date'=> date("Y/m/d H:i:s",$order['paytime']), 
				'ME_type'=> "PS",
				'ME_vnumber'=> $order['order_sn'], // 订单号
				'ME_supcus'=> $member['customer_no'],
				'ME_termCX'=> $member['day']."|", // Edit Date 04/11/2023 Number Day Due Date
				'ME_termPX'=> "100|", // Edit Date 04/11/2023 Payment Percentage
				'ME_termAX'=> $order['total_amount']."|", // Net amount Or NetTotal
				'ME_termDX'=>  date("d/m/Y",strtotime("+".$member['day']." days",strtotime(date("Y/m/d",$order["paytime"]))))."|",  // Edit Date 04/11/2023 Payment Due Date
				'ME_cashRec'=> 0, // Edit Date 04/11/2023 Amount received in cash
				'ME_ccRec'=> $order['total_amount'], // Edit Date 04/11/2023 The amount received is on credit or check
			],
			'krows'=>[
				'MK_date'=>date("Y/m/d H:i:s",$order['paytime']),
				'MK_name'=>$order['consignee'],
				'MK_addr'=>$order['address'].' '.$order['area_name'].' '.$order['city_name'].' '.$order['province_name'].' '.$order['code'],
				'MK_tel'=>"".$order['phone'],
			],


		];
		$lrows = [];
// 	var_dump(1);die;
        //  var_dump($orderGoods);die;
		foreach ($orderGoods as $index=>$og) {
// 			$goods = pdo_get('ewei_shop_goods', ['id' => $og['goodsid']]);
// var_dump($og);die;
            $goods=Db::name('shopro_goods_sku_price')->where('id',$og['goods_sku_price_id'])->find();
            if(empty($goods['sn'])){
                // var_dump(2);die;
                return ['Success'=>false,'Message'=>'Product ID cannot be empty'];
            }
//   var_dump(1);die;
			$stk =$goods['sn'];
			$erp_title = $goods['erp_title'];
			if(empty($erp_title)){
			    return ['Success'=>false,'Message'=>'没有同步erp商品名称'];
			}
			$lrData = [
				'ML_date' => date("Y/m/d H:i:s",$order['paytime']),
				'ML_type' => "PS",
				'ML_vnumber' => $order['order_sn'],
				'ML_per' => $member['sale_no'],
				'ML_supcus' => $member['customer_no'],
				'ML_stk' => $stk, //商品库存编码 2
				'ML_sto' => $this->storeCode, //仓库编码
				'ML_item' => $index + 1, //序号
				'ML_quan' => $og['goods_num'], //数量 4
				'ML_cog' => $og['pay_price'],// 总金额 6
				'ML_netL' => $og['pay_price'],//  总金额含税 6
				'ML_cut' => 1,//  是否减库存 6
				'ML_unit' => "PCS", //单位 4
				'ML_des' => $erp_title, // 4
				'ML_addcost' => 0, // 4
				'ML_deldate' => date("Y/m/d",strtotime("+".$member['day']." days",strtotime(date("Y/m/d",$order["paytime"])))), // 4 // Edit Date 04/11/2023 Due Date delivery
				// 'ML_uname' => "ชิ้น", //单位 4
				'ML_uprice' => $og['goods_price'] , // 单价 5
				// 'ML_upriceP' => round($og['realprice'] / $og['total'],2), // 单价 5
			];
			$lrows[] = $lrData;
		}
// 		var_dump($lrData);die;
		$params['lrows'] = $lrows;
	var_dump($params);
		$json = json_encode($params);
		$result =  $this->curl_http_post($url, $params,$this->header);
		$result = json_decode($result, true);
    var_dump($result);die;
		 if ($result['Success']) {
		     
		     return 'true';
		
		 }
		 return 'false';
// 		return $result;

	}



	//推送会员地址 order_id就是订单推送的地址
	public function saveAddressByid($id,$order_id=0)
	{
	    $address=Db::name('shopro_user_address')->where('id',$id)->find();
	    $member=Db::name('user')->where('id',$address['user_id'])->find();
	    if($order_id>0){
	         $sort=$member['address_sort'];
	       //  $is=1;
	    }
	    else{
	         if(!$address['sort']){
    	         $sort=$member['address_sort'];
    	         $is=1;
    	    }
    	    else{
    	       $sort=$address['sort'];
    	    }
	    }
	   
	   

		$url = $this->baseUrl.'V3/savecode/' . $this->COMcode . '/delivery-address';
        
		$params = [
			'DC_code' => $member['customer_no'], // 客户编码
			'DC_id' => $sort, //
			'DC_add1' => $address['address'], // 地址1
			'DC_add2' =>$address['city_name'] . " " . $address['area_name'], 
			'DC_add3' => $address['province_name'].' '.$address['code'], 
// 			'DC_add1' => $address['province_name'] . " " . $address['city_name'] . " " . $address['area_name'] . " " . $address['address'], // 地址1    
// 			'DC_add2' => $address['province_name'] . " " . $address['city_name'] . " " . $address['area_name'] . " " . $address['address'], // 地
// 			'DC_add3' => $address['province_name'] . " " . $address['city_name'] . " " . $address['area_name'] . " " . $address['address'], // 地
			'DC_tel' => "".$address['phone'], // 	电话
			
// 			'DC_zone' => $address['code'], // 	邮编
		];
        // var_dump($url);
        // var_dump($params);
		$result =  $this->curl_http_post($url, $params,$this->header);
		$result = json_decode($result, true);
// 		var_dump($result);die;
		if ($result['Success']) {
		    if(empty($is)){
		        if($order_id>0){
		            //   Db::name('shopro_user_address')->where('id',$id)->update(['sort'=>$member['sort']]);
		            Db::name('shopro_order')->where('id',$order_id)->update(['erp_addressid'=>$sort]);
		        }
		        else{
		            Db::name('shopro_user_address')->where('id',$id)->update(['sort'=>$sort]); 
		        }
		       
		        Db::name('user')->where('id',$address['user_id'])->setInc('address_sort',1);
		    }
		    if($order_id>0){
		        return $sort;
		    }
		    return true;
		}
		return false;
	}









	protected function curl_http_get($url,$header = [] ){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
		$res = curl_exec($ch);
		curl_close($ch);
		return $res;
	}

	protected function curl_http_post($url,$data = [],$header = [],$timeout = 0){

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch,CURLOPT_POST,1);
		if ($timeout > 0) {
			curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
		}
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
// 		curl_setopt( $ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
		$res = curl_exec($ch);
        if(curl_errno($ch)){
	  
	   // echo ;
	  	return 'Curl error: ' . curl_error($ch);
	    // writeLog();
	  }
		curl_close($ch);
		return $res;
	}

}