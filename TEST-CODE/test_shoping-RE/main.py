import re
import time
import requests
import pytest
# http://sahitest.com/demo/
class Test_login():

    serves=requests.session()
    def test_login_one(self):
        rep = Test_login.serves.request(method="get", url="https://app.zydjy.vip/addons/shopro/school/list")
        print(rep.elapsed,"\n",rep.cookies,"\n",rep.headers,"\n",rep.json())

    def test_login_two(self):
        data={
            "title":"学校名称"
        }
        rep = Test_login.serves.request(method="get", url="https://app.zydjy.vip/addons/shopro/school/list",params=data)
        print( rep.elapsed, "\n", rep.cookies, "\n", rep.headers, "\n", rep.json())

    def test_login_3(self):
        """<?xml version="1.0" encoding="UTF-8"?>
             <request>
            <saleOrderCode>string</saleOrderCode>
        <wmsDeliveryDate>string</wmsDeliveryDate>
<expressName>string</expressName>
<expressCode>string</expressCode>
<carryCode>string</carryCode>
</request>"""
        header = {
            "token": "5e3a2e29-010c-40d0-9348-b4d87f5a2273"
        }
        data = {
            "saleOrderCode":"",
            "wmsDeliveryDate": "2023-10-1",
            "expressName": "百世物流",# 物流公司名称
            "expressCode": "BEST",# 物流公司代码；BEST = 百世物流、DB = 德邦物流、EMS = EMS、HTKY = 汇通快运、POSTB = 邮政小包、SF = 顺丰快递、STO = 申通、TTKDEX = 天天快递、YTO = 圆通速递、YUNDA = 韵达、ZTO = 中通速递
            "carryCode": "BEST20001"#物流单号
        }
        rep = Test_login.serves.request(method="post", url="https://app.zydjy.vip/addons/shopro/order/PushOrder",
                                        json=data,headers=header)
        print(rep.elapsed, "\n", rep.cookies, "\n", rep.headers, "\n", rep.json())
    def test_Query(self):
        # status string 必需分销商状态: all = 全部, pending = 审核中, normal = 正常
        data={
            "status":"all"
        }
        rep = Test_login.serves.request(method="get", url="https://xcxzy.qifudaren.net/commission.agent/team",params=data)
        print(rep.elapsed,"\n",rep.cookies,"\n",rep.headers,"\n",rep.json())

    def test_Query_Header(self):
        # status string 必需分销商状态: reject：驳回,agree：同意
        data = {
            "status": "reject",
            "id":985
        }
        header={
            "token":"5e3a2e29-010c-40d0-9348-b4d87f5a2273"
        }

        rep = Test_login.serves.request(method="get", url="https://xcxzy.qifudaren.net/addons/shopro/commission.agent/operate", params=data,headers=header)
        print(rep.elapsed, "\n", rep.cookies, "\n", rep.headers, "\n", rep.json())
    @classmethod
    def main(cls):
        m=Test_login()
        a=[m.test_login_one(),m.test_login_two(),m.test_login_3(),m.test_Query(),m.test_Query_Header()]
        for ig in a:
            print(ig)
if __name__ == '__main__':
    Test_login.main()
    # pytest.main(['-vs'])