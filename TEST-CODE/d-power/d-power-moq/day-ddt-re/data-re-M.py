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

def list_spilst(data):
    abds=data.split(",")
    return abds

def list_children(color,size,mqr,modble):
    add_file_moble=[]
    add_file_color=[]
    add_file_size =[]
    add_file_mqr = []
    modble=list_spilst(modble)
    # print(color)
    if modble!=[]:
        for dilid in range(0, len((color))):
            # print(dilid,color[dilid])
            afile = {"id": 0, "temp_id": dilid+4, "name": color[dilid], "pid": 0}
            add_file_color.append(afile)

    color = list_spilst(color)
    if color!=[]:
        for dilid in range(0, len((color))):
            # print(dilid,color[dilid])
            afile = {"id": 0, "temp_id": dilid+4, "name": color[dilid], "pid": 0}
            add_file_color.append(afile)
    size = list_spilst(size)
    if size!=[]:
        for dilid in range(len(size)):
            afile = {"id": 0, "temp_id":len(color)+4+dilid, "name": size[dilid], "pid": 0}
            add_file_size.append(afile)
    mqr=list_spilst(mqr)
    if mqr!=[]:
        for dilid in range(len(mqr)):
            afile = {"id": 0, "temp_id":len(color)+4+dilid+len(size), "name": mqr[dilid], "pid": 0}
            add_file_mqr.append(afile)
    all_file=[add_file_color,add_file_size,add_file_mq]
    return all_file
def listData_sku(size,color,mqr):
    data=[]
    if color!="":
        data_color = {"id": 0, "temp_id": 1, "name": "Color", "pid": 0,"children": list_children(size=size,color=color,mq=mq)[0]}
        data.append(data_color)
    if size!="":
        data_size={"id": 0, "temp_id": 2, "name": "Size", "pid": 0,"children":list_children(size=size,color=color,mq=mq)[1]}
        data.append(data_size)
    if mq != "":
        data_mq={"id": 0, "temp_id": 3, "name": "Material quality", "pid": 0,"children":list_children(size=size,color=color,mq=mq)[2]}
        data.append(data_mq)

    return json.dumps(data)
def goods_sku(color,size,mq):
    sku_color=[]
    sku_size = []
    sku_mq=[]
    if color != "":
        color = list_spilst(color)
        for dilid in range(0, len((color))):
            # print(dilid,color[dilid])
            afile =[dilid+4,color[dilid]]
            sku_color.append(afile)
    if size!="":
        size = list_spilst(size)
        for dilid in range(len(size)):
            afile = [len(color)+4+dilid,size[dilid]]
            sku_size.append(afile)
    if mq!="":
        mq= list_spilst(mq)
        for dilid in range(len(mq)):
            afile = [len(color)+4+dilid+len(size),mq[dilid]]
            sku_mq.append(afile)
    data_all=[]
    if sku_size != []:
        data_all.append(sku_size)
    if sku_color!=[]:
        data_all.append(sku_color)
    if sku_mq!=[]:
        data_all.append(sku_mq)
    return data_all
def priceData_sku(color,size,price,inventory,mq):
    sku_all=goods_sku(color=color,size=size,mq=mq)
    # print(sku_all[0])
    pa_data=[]
    for kis in range(len(sku_all[0])):
        id = 0
        abc=sku_all[0][kis]

        if color != "" and size != "":
            for pop in sku_all[1]:
                id = id + 1
                id_ids = [abc[0], pop[0]]
                id_text = [str(abc[1]), str(pop[1])]
                data_m = {"id": 0,
                        "temp_id": id,
                        "goods_sku_ids": "",
                        "goods_id": 0,
                        "weigh": 0,
                        "image": "",
                        "stock":inventory ,
                        "stock_warning":None,
                        "price": price,
                        "cost_price": "",
                        "sn": "",
                        "tm": "",
                        "weight": 0,
                        "status": "up",
                        "goods_sku_text": id_text,
                        "goods_sku_temp_ids": id_ids}
                pa_data.append(data_m)
        else:
            id_ids = [abc[0]]
            id_text = [str(abc[1])]
            data_l = {"id": 0,
                    "temp_id": kis+1,
                    "goods_sku_ids": "",
                    "goods_id": 0,
                    "weigh": 0,
                    "image": "",
                    "stock": inventory,
                    "stock_warning": None,
                    "price": price,
                    "cost_price": "",
                    "sn": "", "tm": "",
                    "weight": 0,
                    "status": "up",
                    "goods_sku_text": id_text,
                    "goods_sku_temp_ids": id_ids}
            pa_data.append(data_l)
    return json.dumps(pa_data)
def up_data_M(mqr,moble,sku_price,sku_if,text,type,img,size,color,imgs,price,price1,price2,inventory,pop,volume,supplier,sort,subtitle,title,titleen,titletw,weight,a1,a2):
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
        "sku[listData]":listData_sku(size=size,color=color,mq=mq),
        "sku[priceData]":priceData_sku(price=price,size=size,color=color,inventory=inventory,mq=mq)
    }
    data["row[cost_price]"]=""
    return data
if __name__ == '__main__':
    import json

    size = "sfsfafsaf"
    color = "40*99cm,1233"
    price = "22"
    # size=""
    color = ""
    pps = [{'id': 0, 'temp_id': 4, 'name': '颜色', 'pid': 0}]
    print(json.dumps(pps))
    print(listData_sku(size=size, color=color))
    print(priceData_sku(price=price, size=size, color=color))
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
