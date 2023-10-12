# "sku[listData]": '[{"id":0,"temp_id":1,"name":"规格名称1","pid":0,"children":[{"id":0,"temp_id":2,"name":"1。1","pid":0},{"id":0,"temp_id":4,"name":"1.2","pid":0}]},{"id":0,"temp_id":3,"name":"规格名称2","pid":0,"children":[{"id":0,"temp_id":5,"name":"2.1","pid":0},{"id":0,"temp_id":6,"name":"2.2","pid":0}]}]',
# "sku[priceData]": '[{"id":0,"temp_id":1,"goods_sku_ids":"","goods_id":0,"weigh":0,"image":"","stock":"1","stock_warning":null,"price":"1121","cost_price":"","sn":"","tm":"","weight":0,"status":"up","goods_sku_text":["1。1","2.1"],"goods_sku_temp_ids":[2,5]},{"id":0,"temp_id":2,"goods_sku_ids":"","goods_id":0,"weigh":0,"image":"","stock":"2","stock_warning":null,"price":"1221","cost_price":"","sn":"","tm":"","weight":0,"status":"up","goods_sku_text":["1.2","2.1"],"goods_sku_temp_ids":[4,5]},{"id":0,"temp_id":3,"goods_sku_ids":"","goods_id":0,"weigh":0,"image":"","stock":"3","stock_warning":null,"price":"1122","cost_price":"","sn":"","tm":"","weight":0,"status":"up","goods_sku_text":["1。1","2.2"],"goods_sku_temp_ids":[2,6]},{"id":0,"temp_id":4,"goods_sku_ids":"","goods_id":0,"weigh":0,"image":"","stock":"4","stock_warning":null,"price":"1222","cost_price":"","sn":"","tm":"","weight":0,"status":"up","goods_sku_text":["1.2","2.2"],"goods_sku_temp_ids":[4,6]}]'

# listData=[
#     {"id":0,"temp_id":1,"name":"规格名称1","pid":0,
#      "children":[
#          {"id":0,"temp_id":2,"name":"1。1","pid":0},
#          {"id":0,"temp_id":4,"name":"1.2","pid":0}]},
#     {"id":0,"temp_id":3,"name":"规格名称2","pid":0,
#      "children":[{"id":0,"temp_id":5,"name":"2.1","pid":0},
#                  {"id":0,"temp_id":6,"name":"2.2","pid":0}]}]
import json
from math import factorial

def list_spilst(data):
    if data=="":
        return ""
    else:
        return data.split(",")

def list_children(color,size,mqr,modble):
    data=[]
    modble=list_spilst(modble)
    color = list_spilst(color)
    size = list_spilst(size)
    mqr = list_spilst(mqr)
    sku_price={}
    # print(color)
    # sku_len=len(modble)+len(color)+len(size)+len(mqr)
    # a_modble={"Modble":modble}
    # b_color={"Color":color}
    # c_size={"Size":size}
    # d_mqr={"MQR":mqr}
    sku_id_m = 1
    if modble !="":
        abcd = []
        sku_id=sku_id_m
        # sku_da=[]
        for dilid in range(0, len((modble))):
            # print(dilid,color[dilid])
            sku_id_m=sku_id_m+1
            afile = {"id": 0, "temp_id":sku_id_m, "name": modble[dilid], "pid": 0}
            abcd.append(afile)
            sku_i={str([str(sku_id_m),modble[dilid]]):"model"}
            sku_price.update(sku_i)
        data_model = {"id": 0, "temp_id":sku_id, "name": "Model", "pid": 0,
                      "children": abcd}
        data.append(data_model)
        # a={"mobel",str(sku_da)}
        # sku_price.update(a)
    if color != "":
        abcd = []
        sku_id=sku_id_m
        for dilid in range(0, len((color))):
            # print(dilid,color[dilid])
            sku_id_m = sku_id_m + 1
            afile = {"id": 0, "temp_id": sku_id_m, "name": color[dilid], "pid": 0}
            abcd.append(afile)
            sku_i = {str([str(sku_id_m), color[dilid]]): "color"}
            sku_price.update(sku_i)
        data_color = {"id": 0, "temp_id":sku_id, "name": "Color", "pid": 0,
                      "children": (abcd)}
        data.append(data_color)
        # b={"color",sku_da}
        # sku_price.update(b)
    if size != "":
        abcd = []
        sku_id=sku_id_m
        for dilid in range(0, len(size)):
            sku_id_m = sku_id_m + 1
            afile = {"id": 0, "temp_id": sku_id_m, "name": size[dilid], "pid": 0}
            abcd.append(afile)
            sku_i = {str([str(sku_id_m), size[dilid]]): "size"}
            sku_price.update(sku_i)
        data_size = {"id": 0, "temp_id":sku_id, "name": "Size", "pid": 0,
                      "children": (abcd)}
        data.append(data_size)
        # c={"size",sku_da}
        # sku_price.update(c)
    if mqr != "":
        abcd = []
        sku_id=sku_id_m
        for dilid in range(0, len(mqr)):
            sku_id_m = sku_id_m + 1
            afile = {"id": 0, "temp_id": sku_id_m,
                     "name": mqr[dilid], "pid": 0}
            abcd.append(afile)
            sku_i = {str([str(sku_id_m), mqr[dilid]]): "mqr"}
            sku_price.update(sku_i)
        data_mqr = {"id": 0, "temp_id":sku_id, "name": "MQR", "pid": 0,
                      "children": (abcd)}
        data.append(data_mqr)
        # d={"mqr",sku_da}
        # sku_price.update()
    return json.dumps(data),sku_price

from itertools import combinations
import itertools
def sku_len(color,size,mqr,model):
    # arrays={}
    abcd=[]
    if model!=[]:
        abcd.append(model)
        # a = {"model,"+str(len(model)):model}
        # arrays.update(a)
    if color != []:
        abcd.append(color)
        # a = {"cole,"+str(len(color)):color}
        # arrays.update(a)
    if size!=[]:
        abcd.append(size)
        # a = {"size,"+str(len(size)): size}
        # arrays.update(a)
    if mqr!=[]:
        abcd.append(mqr)
        # a = {"mqr,"+str(len(size)):mqr}
        # arrays.update(a)
    conbit=list(itertools.product(*abcd))

    num_all=[]
    for con in conbit:
        a_id=[]
        b_name=[]
        for mon in con:
            akm=list_spilst(mon)
            # print(akm[0][1:],akm[1][:-1])
            a_id.append(akm[0][2:-1])
            # print(a_id)
            b_name.append(akm[1][2:-3])
            # print(b_name)
        # num_all.update({str(a_id):str(b_name)})
        a=[a_id,b_name]
        num_all.append(a)
    # print(num_id,num_name)

    return num_all

def sku_json(t_id,price,up_down,id_text,id_ids):
    data_m = {"id": 0,
              "temp_id": t_id,
              "goods_sku_ids": "",
              "goods_id": 0,
              "weigh": 0,
              "image": "",
              "stock": 10,#库存
              "stock_warning": None,
              "price": price,
              "cost_price": "",
              "sn": "",
              "tm": "",
              "weight": 0,
              "status": up_down,#down
              "goods_sku_text": id_text,
              "goods_sku_temp_ids": id_ids}
    return data_m
def sku_price(data):
    if data=="":
        return ""
    else:
        akd=[]
        for i in data.split("\n"):
            prs=(i.split(","))
            akd.append(prs)
        return akd

def listgoods_sku(color,size,mqr,model,price,price_sku):
    data_m=list_children(color=color,size=size,mqr=mqr,modble=model)[0]
    aaaa=list_children(color=color,size=size,mqr=mqr,modble=model)[1]
    # print(len(aaaa))
    sku_color=[]
    sku_size=[]
    sku_mqr=[]
    sku_model=[]
    sku_app=[]
    for anga in aaaa:
        if aaaa[anga]=="model":
            sku_model.append(anga)
        if aaaa[anga]=="color":
            sku_color.append(anga)
        if aaaa[anga]=="size":
            sku_size.append(anga)
        if aaaa[anga]=="mqr":
            sku_mqr.append(anga)
    skulen = sku_len(color=sku_color, size=sku_size, mqr=sku_mqr, model=sku_model)
    # print(len(skulen),skulen)
    price_sku=sku_price(price_sku)
    if price_sku == "":
        for slu in range(len(skulen)):
            sk1=sku_json(t_id=slu+1,up_down="up",price=price,id_text=skulen[slu][1],id_ids=skulen[slu][0])
            sku_app.append(sk1)
        # print(slu,)
    else:
        idsd=1
        avv=[]
        amm=[]
        for ais in price_sku:
            # print(ais)
            avv.append(ais[:-1])
            # print(avv)
            for poi in skulen:
                if ais[:-1]==poi[1]:
                    sk1 = sku_json(t_id=idsd, up_down="up", price=round(float(ais[-1]),2), id_text=poi[1],
                                   id_ids=poi[0])
                    sku_app.append(sk1)
                    idsd=idsd+1

        for poi in skulen:
            amm.append(poi[1])
        new_amm=[x for x in amm if x not in avv]
        # print(type(amm),type(avv))
        # not_sku=set(amm).intersection(set(avv))
        # for elemp in not_sku:
        #     amm.remove(elemp)
        for iop in new_amm:
            for ak in skulen:
                if ak[1]==iop:
                    sk1 = sku_json(t_id=idsd, up_down="down", price=price, id_text=ak[1], id_ids=ak[0])
                    sku_app.append(sk1)
                    idsd=idsd+1
        # print(new_amm)
    return data_m,json.dumps(sku_app)


def up_data_M(mqr,moble,sku_price,text,type,img,size,color,imgs,price,price1,price2,inventory,pop,volume,supplier,sort,subtitle,title,titleen,titletw,weight,a1,a2):
    data = {
        "row[category_ids]":type,#商品类型69,179,183,187,186,194,198,248,316
        "row[content]":text,#"<p>图文详情<br/></p>"
        "row[dispatch_ids]":"1",
        "row[is_back]":"0",
        "row[dispatch_type]":"express",
        "row[expire_day]":"0",
        "row[image]":img,#"/uploads/20231008/b0cd6255037762f42a31d358be6f7446.png",
        "row[images]":imgs,#"/uploads/20231008/7bea85a6832b2d95e782747172843b0f.png,/uploads/20231008/b0cd6255037762f42a31d358be6f7446.png",
        "row[is_score]":"0",
        "row[score_bi]":"",
        "row[is_sku]":"1",#0为单1为多
        "row[original_price]":price1,#划线价格
        "row[params]":"[]",
        "row[price]":price,#价格
        "row[cost_price]":price2,#成本价格
        "row[service_ids]":"",
        "row[show_sales]":volume,#虚假销量
        "row[store_type]":"0",
        "row[status]":"up",#上架
        "row[gongyingshang]":supplier,#供应商
        "row[subtitle]":subtitle,#副标题
        "row[title]":title,#标题
        "row[title_en]":titleen,#标题en titleen
        "row[title_tw]":titletw,#标题tw titletw
        "row[type]":"normal",
        "row[views]":pop,#虚假人数pop
        "row[is_hui]":"0",
        "row[is_pi]":"0",
        "row[weigh]":sort,#排序
        "row[weight]":weight,#商品重量weight
        "row[stock]":inventory,#库存inventory
        "row[stock_warning_switch]": "false",
        "row[stock_warning]":"",
        "row[sn]":a1,#商品编码
        "row[tm]":a2,#商品条码
        "row[zenggoods_sku_id]":"0",
        "row[autosend_content]":"",
        "row[zenggoods_id]":"",
        "sku[listData]":(listgoods_sku(size=size, color=color,mqr=mqr,model=moble,price=price,price_sku=sku_price))[0],
        "sku[priceData]":(listgoods_sku(size=size, color=color,mqr=mqr,model=mod,price=price,price_sku=sku_price))[1]}
    data["row[cost_price]"]=""
    return data
if __name__ == '__main__':


    size = "size1,size2"
    color = "co1,c02"
    price = "22"
    mqr="mq1,mq2"
    mod="ble1,ble2"
    proce_sku="ble1,co1,size1,mq1,1999\n"
    # proce_sku=""
    # size=""
    # color = ""
    # mod=""
    # if list_spilst(size)=="":
    #     print(list_spilst(proce_sku))
    # pps = [{'id': 0, 'temp_id': 4, 'name': '颜色', 'pid': 0}]
    # print(json.dumps(pps))
    # print(list_children(size=size, color=color,mqr=mqr,modble=modble))
    print(listgoods_sku(size=size, color=color,mqr=mqr,model=mod,price=price,price_sku=proce_sku))


    # print(listpriceData_sku(price=price, size=size, color=color))
# priceData=[{"id":0,
#             "temp_id":1,
#             "goods_sku_ids":"",
#             "goods_id":0,
#             "weigh":0,
#             "image":"",
#             "stock":"1",
#             "stock_warning":"null",
#             "price":"1121",
#             "cost_price":"",
#             "sn":"","tm":"",
#             "weight":0,
#             "status":"up",
#             "goods_sku_text":["1。1","2.1"],
#             "goods_sku_temp_ids":[2,5]},{"id":0,
#             "temp_id":2,
#             "goods_sku_ids":"",
#             "goods_id":0,"weigh":0,
#             "image":"","stock":"2",
#             "stock_warning":"null",
#             "price":"1221",
#             "cost_price":"",
#             "sn":"","tm":"",
#             "weight":0,
#             "status":"up",
#             "goods_sku_text":["1.2","2.1"],
#             "goods_sku_temp_ids":[4,5]},
#             {"id":0,"temp_id":3,"goods_sku_ids":"","goods_id":0,
#             "weigh":0,"image":"","stock":"3","stock_warning":null,
#             "price":"1122","cost_price":"","sn":"",
#             "tm":"","weight":0,"status":"up",
#             "goods_sku_text":["1。1","2.2"],
#             "goods_sku_temp_ids":[2,6]},{"id":0,"temp_id":4,"goods_sku_ids":"","goods_id":0,"weigh":0,"image":"","stock":"4","stock_warning":null,"price":"1222","cost_price":"","sn":"","tm":"","weight":0,"status":"up","goods_sku_text":["1.2","2.2"],"goods_sku_temp_ids":[4,6]}]
#
#
#
