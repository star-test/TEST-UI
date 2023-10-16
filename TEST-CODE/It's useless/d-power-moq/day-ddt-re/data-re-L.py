
import os
import pandas as pd
import numpy as np
import time
import random
import json
import requests

# import openpyxl
# from googletrans import Translator
# from bs4 import BeautifulSoup
# def data_ddt():
#     # 打开Excel文件
#     workbook = openpyxl.load_workbook(init_fille())
#     # 获取第一个工作表
#     worksheet = workbook.active
#     # 定义字典变量
#     data = {}
#     # 遍历每一行数据，将其添加到字典中
#     for row in worksheet.iter_rows(min_row=0):  # 从第二行开始遍历，因为第一行是标题行
#         key = row[0].value  # 获取第一列的值作为key
#         values = [cell.value for cell in row[1:]]  # 获取剩余列的值作为values列表
#         data[key] = values  # 将key和values添加到字典中
#     # 输出结果
#     print(data)


# def data_en(data):
#     time.sleep(random.randint(1, 5))
#     translator = Translator()
#     # 定义一个字典，包含中英文键值对
#     # 遍历字典中的每个键值对，将中文翻译成英文
#     for key in data:
#         value = data[key]
#         if isinstance(value, str):  # 如果值是字符串类型，则进行翻译
#             translated_value = translator.translate(
#                 value, src='zh-CN', dest='en').text  # 使用googletrans进行翻译
#             data[key] = translated_value  # 将翻译后的值更新到字典中对应的键上
#     return data  # 输出翻译后的字典
# def en(text):
#     time.sleep(random.randint(1, 5))
#     # 创建翻译器对象
#     translator = Translator()
#     # 翻译成英文
#     translated_text = translator.translate(
#     str(text), src='zh-CN', dest='en').text
#     # 输出结果
#     return translated_text
# def code_en(code):
#     url="https://translate.google.com/"
#     # url = 'https://api.cognitive.microsofttranslator.com/translate?api-version=3.0'
#     # headers = {"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0"}
#     # # params = {'to': 'en', 'from': 'zh-CN',"query":code,"transtype": "enter","simple_means_flag": "3","sign": "797120.576241",
# 	# "token": "6faadfa116eee0a50deac11629a5e1d7","domain": "common","ts": "1696821688483"}
#     params={'tl': 'en', 'sl': 'zh-CN',"text":code,"op":"translate"}
#     time.sleep(random.randint(2,5))
#     response = requests.post(url, params=params,)
#
#     # text = BeautifulSoup(response.text, 'lxml')
#     print(response.json)
#
def init_fille():
    """读文件"""
    xml_files = []
    for root, dirs, files in os.walk(os.getcwd()):
        for file in files:
            if os.path.splitext(file)[1] == '.xlsx':
                xml_file = os.path.join(os.getcwd(), file)  # 文件
                """处理数据"""
                xml_files.append(xml_file)
    return xml_files

def data_if(text):
    # 判断是否为空
    # print(type(text))
    text1=np.str_(text)
    if text1=='nan':
        return ""
    else:
        return (str(text1))


def data_iftype(type):
    """类型"""
    code = {
    "充电宝": "69,74,206",
    "数据线": "69,74,75",
    "充电器": "69,74,76",
    "充电器套装": "69,74,77",
    "内置电池": "69,74,207",
    "钢化膜": "69,74,208",
    "手机支架": "69,74,228",
    "手机壳": "69,74,278",
    "音频类": "69,74,279",
    "其它配件": "69,74,280",
    "车载配件":"69,74,335",
    "蓝牙耳机":"69,78,79",
    "有线耳机":"69,78,80",
    "运动耳机":"69,78,81",
    "广告机":"69,337,338",
    "迷你音箱":"179,264,287",
    "台式音箱":"179,264,288",
    "桌面音箱":"179,264,289",
    "Party Box":"179,264,333",
    "拉杆音箱":"179,264,334",
    "All speaker":"179,264,336",
    "电熨斗":"183,294,295",
    "吹风机":"183,294,297",
    "电火锅":"183,294,298",
    "电水壶":"183,294,299",
    "电磁炉":"183,294,300",
    "电饭锅":"183,294,301",
    "电烤炉":"183,294,302",
    "榨汁机":"183,294,321",
    "绞肉机":"183,294,325",
    "迷你风扇":"183,294,358",
    "落地风扇":"183,294,359",
    "空气炸锅":"183,294,452",
    "其他电器":"183,294,453",
    "加湿器":"183,327,328",
    "灯具":"183,327,329",
    "投影仪":"183,327,332",
    "电视机":"183,327,360",
    "除湿机":"183,327,361",
    "户外移动空调":"183,327,362",
    "吹风机":"183,363,364",
    "电动牙刷":"183,363,365",
    "剃须刀":"183,363,366",
    "卷/直发器":"183,363,367",
    "美容仪":"183,363,368",
    "按摩仪":"183,363,369",
    "水杯":"187,231,232",
    "锅具":"187,231,233",
    "厨房配件":"187,231,234",
    "刀具":"187,231,235",
    "置物架":"187,231,236",
    "果盘":"187,231,246",
    "碗碟":"187,231,331",
    "马桶清洁":"187,379,380",
    "浴巾":"187,379,381",
    "防滑垫":"187,379,382",
    "拖鞋":"187,379,383",
    "置物架":"187,379,450",
    "抱枕靠垫":"187,239,240",
    "地毯地垫":"187,239,241",
    "收纳用品":"187,239,247",
    "床上用品":"187,239,370",
    "日百商品":"187,239,371",
    "遮阳伞":"187,242,243",
    "雨伞":"187,242,244",
    "儿童伞":"187,242,245",
    "雨衣":"187,242,372",
    "钥匙链 ":"187,319,373",
    "项链":"187,319,374",
    "耳钉":"187,319,375",
   "戒指" :"187,319,376",
    "手表":"187,319,377",
    "礼品袋":"187,320,378",
    "移动硬盘":"186,226,227",
    "U盘":"186,226,308",
    "存储卡":"186,226,384",
    "鼠标":"186,309,339",
    "键盘":"186,309,451",
    "工具配件":"194,340,341",
    "电动工具":"194,340,342",
    "工具套装":"194,340,343",
    "身体防护":"194,344,345",
    "管材":"194,346,347",
    "控电配件":"194,346,348",
    "机械配件":"194,346,349",
    "手机包":"198,199,201",
    "手提包":"198,199,202",
    "斜挎包":"198,199,203",
    "遮阳帽":"198,200,204",
    "渔夫帽":"198,200,205",
    "袜子":"198,385,386",
    "工具类":"248,249,250",
    "画具画材":"248,249,387",
    "笔":"248,249,388",
    "橡皮擦":"248,249,389",
    "笔记本":"248,249,390",
    "便利贴":"248,249,391",
    "计算器":"248,249,392",
    "文件收纳":"248,313,314",
    "打印纸":"248,313,393",
    "财会用品":"248,313,394",
    "球类":"248,322,395",
    "骑行类":"248,322,396",
    "体育配件":"248,322,397",
    "玩具":"316,350,351",
    "牵引绳":"316,350,352",
    "猫包":"316,350,353",
    "宠物鞋服":"316,350,354",
    "自动喂食器":"316,350,355",
    "洗护美容":"316,350,356",
    "消耗类用品":"316,350,357",
    "帐篷":"317,398,399",
    "睡袋":"317,398,400",
    "露营拖车":"317,398,401",
    "户外桌椅":"317,398,402",
    "登山绳":"317,398,403",
    "防潮垫":"317,398,404",
    "防风衣裤":"317,398,405",
    "手套":"317,398,406",
    "烧烤架":"317,398,407",
    "水壶":"317,398,408",
    "太阳能灯":"317,398,409",
    "户外电源":"317,398,410",
    "太阳能面板":"317,398,411",
    "防水灯":"317,398,412",
    "遮瑕":"318,413,414",
    "粉底液":"318,413,415",
    "眉笔":"318,413,416",
    "眼线笔":"318,413,417",
    "口红":"318,413,418",
    "散粉":"318,413,419",
    "美甲":"318,413,420",
    "眉夹":"318,421,422",
    "睫毛夹":"318,421,423",
    "粉刺针":"318,421,424",
    "化妆棉":"318,421,425",
    "棉签":"318,421,426",
    "洗脸巾":"318,421,427",
    "铲子":"323,428,429",
    "锄头":"323,428,430",
    "喷壶/喷头":"323,428,431",
    "除草机":"323,428,432",
    "水管":"323,428,433",
    "营养土":"323,434,435",
    "花盆/花箱":"323,434,436",
    "仿真草坪":"323,434,437",
    "智能灯":"324,438,439",
    "温度计":"324,438,440",
    "智能马桶盖":"324,438,441",
    "智能窗帘":"324,438,442",
    "智能垃圾桶":"324,438,443",
    "智能门锁":"324,444,445",
    "智能门铃":"324,444,446",
    "智能插座":"324,444,447",
    "监控":"324,444,448",
    "门窗控制器":"324,444,449"
}

    key = code[type]
    spkey = key.split(",")
    dt = str(spkey[0])+","+str(spkey[0])+","+str(spkey[1])+"," + \
        str(spkey[0])+","+str(spkey[1])+","+str(spkey[2])+","
    return dt
def data_iftext(text,name,mqr,moble,size,color,quantity,packaging,whys,):
    bok=f'<p>Product Name:{(name)}</p>'
    text1=np.str_(text)
    if text1=='nan':
        if moble!="":
            b=f"<p>Moble:{(moble)}/BOX</p>"
            bok=bok+b
        if size != "":
            b = f'<p>Size:{(size)}</p>'
            bok = bok + b
        if color != "":
            b = f'<p>Color:{(color)}</p>'
            bok = bok + b
        if mqr != "":
            b = f'<p>Material quality:{(mqr)}</p>'
            bok = bok + b
        if quantity!="":
            b=f"<p>{(quantity)}/BOX</p>"
            bok=bok+b
        if packaging != "":
            b = f'<p>Packaging method:{(packaging)}</p>'
            bok = bok + b
        if whys != "":
            b = f'<p>Related configurations:{(whys)}</p>'
            bok = bok + b
        return (bok + '<p><br/></p>')
    else:
        return text1

def data_code():
    supplier = (pd.read_excel(init_fille()[0], usecols=[0]).values)
    title = (pd.read_excel(init_fille()[0], usecols=[1]).values)
    subtitle = (pd.read_excel(init_fille()[0], usecols=[2]).values)
    price2 = (pd.read_excel(init_fille()[0], usecols=[3]).values)
    price = (pd.read_excel(init_fille()[0], usecols=[4]).values)
    price1 = (pd.read_excel(init_fille()[0], usecols=[5]).values)
    inventory = (pd.read_excel(init_fille()[0], usecols=[6]).values)
    img = (pd.read_excel(init_fille()[0], usecols=[7]).values)
    imgs = (pd.read_excel(init_fille()[0], usecols=[8]).values)
    type = (pd.read_excel(init_fille()[0], usecols=[9]).values)  # type
    weight = (pd.read_excel(init_fille()[0], usecols=[10]).values)
    sort = (pd.read_excel(init_fille()[0], usecols=[11]).values)
    # 下面为多规格情况
    moble = (pd.read_excel(init_fille()[0], usecols=[12]).values)#规格型号
    mqr = (pd.read_excel(init_fille()[0], usecols=[13]).values)#材料
    size = (pd.read_excel(init_fille()[0], usecols=[14]).values)#尺寸
    color = (pd.read_excel(init_fille()[0], usecols=[15]).values)#颜色
    quantity = (pd.read_excel(init_fille()[0], usecols=[16]).values)  # n/箱子
    Packaging = (pd.read_excel(init_fille()[0], usecols=[17]).values)  # 包装方式
    moq = (pd.read_excel(init_fille()[0], usecols=[18]).values)  # 名称+moq
    whys = (pd.read_excel(init_fille()[0], usecols=[19]).values)  # 备注
    text=(pd.read_excel(init_fille()[0], usecols=[20]).values)
    sku_l_m=(pd.read_excel(init_fille()[0], usecols=[21]).values)
    sku_price = (pd.read_excel(init_fille()[0], usecols=[22]).values)
    sku_if = (pd.read_excel(init_fille()[0], usecols=[23]).values)
    # 处理表格数据
    # print(data_iftype(type[0][0]))
    len_te = len(supplier)
    das=[]
    for k in range(len_te):
        # print(data_if(title[k][0])+data_if(moq[k][0]))
        payt = {
            "supplier": (supplier[k][0]),
            "title": data_if(title[k][0])+"\tMOQ "+data_if(moq[k][0]),
            "subtitle": data_if(subtitle[k][0]),
            "price2": data_if(round(float(price2[k][0]),2)),
            "price": data_if(round(float(price[k][0]),2)),
            "price1": data_if(round(float(price1[k][0]),2)),
            "inventory": data_if(inventory[k][0]),
            "img": img[k][0],
            "imgs": imgs[k][0],
            "type": data_iftype(type[k][0]),
            "weight": data_if(weight[k][0]),
            "sort": data_if(sort[k][0]),#排序
            ##其他数据
            "moble": data_if(moble[k][0]),#规格
            "mqr": data_if(mqr[k][0]),#材质
            "sku_l_m":data_if(sku_l_m[k][0]),#判断
            "size": data_if(size[k][0]),
            "color": data_if(color[k][0]),
            # "quantity": data_if(quantity[k][0]),
            # "Packaging": data_if(Packaging[k][0]),
            # "moq": data_if(moq[k][0]),
            # "whys": data_if(whys[k][0]),#备注
            "text":data_iftext(whys=data_if(whys[k][0]),color=data_if(color[k][0]),packaging=data_if(Packaging[k][0]),size=data_if(size[k][0]),quantity=data_if(quantity[k][0]),text=text[k][0],moble=data_if(moble[k][0]),name=(supplier[k][0]),mqr=data_if(mqr[k][0])),#文本
            "sku_price":data_if(sku_price[k][0]),#多价格
            "sku_if":data_if(sku_if[k][0]),#判断分类
        }
        das.append(payt)
    return das
def up_data_L(text,type,img,imgs,price,price1,price2,inventory,pop,volume,supplier,sort,subtitle,title,titleen,titletw,weight):
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
        "row[is_sku]":"0",#0为单1为多
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
        "row[stock_warning]":"",
        "row[sn]":"",#商品编码
        "row[tm]":"",#商品条码
        "row[zenggoods_sku_id]":"0",
        "row[autosend_content]":"",
        "row[zenggoods_id]":"",
        "sku[listData]":"[]",
        "sku[priceData]":"[]"
    }
    data["row[cost_price]"]=""
    return data
def data_index():
    datas=data_code()
    pat_all=[]
    for i in range(len(datas)):
        if datas[i]["sku_l_m"]=="0":
            back = up_data_L(supplier=datas[i]["supplier"], title=datas[i]["title"], titleen="", titletw="",
                         type=datas[i]["type"],
                         weight=datas[i]["weight"], subtitle=datas[i]["subtitle"], price1=datas[i]["price1"],
                         imgs=datas[i]["imgs"], img=datas[i]["img"], price=datas[i]["price"], price2=datas[i]["price2"],pop="",
                         sort=datas[i]["sort"],
                         text=datas[i]["text"], inventory=datas[i]["inventory"], volume="")
            pat_all.append(back)
        # elif datas[i]["sku"]=="1":
        #     back = up_data_M(supplier=datas[i]["supplier"], title=datas[i]["title"], titleen="", titletw="",
        #                      type=datas[i]["type"],size=datas[i]["size"],color=datas[i]["color"],
        #                      weight=datas[i]["weight"], subtitle=datas[i]["subtitle"], price1=datas[i]["price1 "],
        #                      imgs=datas[i]["imgs"],
        #                      img=datas[i]["img"], price=datas[i]["price"], price2=datas[i]["price2 "], pop="",
        #                      sort=datas[i]["sort"], mqr=datas[i]["whys"],
        #                       text=datas[i]["text"], inventory=datas[i]["inventory"], volume="",)
        #     pat_all.append(back)
    return pat_all

def d_power_up(po):
    headers={
        "User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0",
        "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",
    #"Cookie":"PHPSESSID=8fctn6876q4m7bevr9g3qjjo48; think_var=zh-cn"
    }
    url = "https://tgsc.qifudaren.net/uLHdDeVJXx.php/shopro/goods/goods/add"
    cookies = {
        "PHPSESSID": "6q06nkjh7941d8nu0esjrslvdm",
        "think_var": "zh-cn"
    }
    # dpower_re=requests.post(url=url,headers=headers,cookies=cookies,data=sku_L)
    # print(dpower_re.json)
    dpower_re=requests.post(url=url,headers=headers,cookies=cookies,data=po)
    print(dpower_re.json)
if __name__ == '__main__':
    a=data_index()
    for i in a:
        # code_en(i)
        print(i)
        # d_power_up(i)
        # time.sleep(random.randint(2,5))
