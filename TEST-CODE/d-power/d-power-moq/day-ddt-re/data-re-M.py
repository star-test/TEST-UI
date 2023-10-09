

def sku_1_up():
    data=[
    {
        "id": 0,
        "temp_id": 1,
        "name": "Color",
        "pid": 0,
        "children": [
            {
                "id": 0,
                "temp_id": 2,
                "name": "Pink",
                "pid": 0
            },
            {
                "id": 0,
                "temp_id": 3,
                "name": "Blue",
                "pid": 0
            },
            {
                "id": 0,
                "temp_id": 4,
                "name": "Purple",
                "pid": 0
            },
            {
                "id": 0,
                "temp_id": 5,
                "name": "Green",
                "pid": 0
            }
        ]
    }
]
def sku_2_up():
    data=[
    {
        "id": 0,
        "temp_id": 1,
        "goods_sku_ids": "",
        "goods_id": 0,
        "weigh": 0,
        "image": "",
        "stock": "10",
        "stock_warning": null,
        "price": "5.27",
        "cost_price": "",
        "sn": "",
        "tm": "",
        "weight": 0,
        "status": "up",
        "goods_sku_text": [
            "Pink"
        ],
        "goods_sku_temp_ids": [
            2
        ]
    },
    {
        "id": 0,
        "temp_id": 2,
        "goods_sku_ids": "",
        "goods_id": 0,
        "weigh": 0,
        "image": "",
        "stock": "10",
        "stock_warning": null,
        "price": "5.27",
        "cost_price": "",
        "sn": "",
        "tm": "",
        "weight": 0,
        "status": "up",
        "goods_sku_text": [
            "Blue"
        ],
        "goods_sku_temp_ids": [
            3
        ]
    },
    {
        "id": 0,
        "temp_id": 3,
        "goods_sku_ids": "",
        "goods_id": 0,
        "weigh": 0,
        "image": "",
        "stock": "10",
        "stock_warning": null,
        "price": "5.27",
        "cost_price": "",
        "sn": "",
        "tm": "",
        "weight": 0,
        "status": "up",
        "goods_sku_text": [
            "Purple"
        ],
        "goods_sku_temp_ids": [
            4
        ]
    },
    {
        "id": 0,
        "temp_id": 4,
        "goods_sku_ids": "",
        "goods_id": 0,
        "weigh": 0,
        "image": "",
        "stock": "10",
        "stock_warning": null,
        "price": "5.27",
        "cost_price": "",
        "sn": "",
        "tm": "",
        "weight": 0,
        "status": "up",
        "goods_sku_text": [
            "Green"
        ],
        "goods_sku_temp_ids": [
            5
        ]
    }
]

def up_init(sku_1,sku_2):
    data = {
        "row[category_ids]": "316,316,350,316,350,351",
        "row[content]": " <p>Product Name: Silver Feather Cat Stick</p><p>Color: Pink/Blue/Purple/Green</p><p>Packaging method: back card+OPP</p><p>Mixable color outfit</p><p><br/></p>",
        "row[dispatch_ids]": "1",
        "row[is_back]": "0",
        "row[dispatch_type]": "express",
        "row[expire_day]": "0",
        "row[image]": "/uploads/20231006/5a749df38287ee6803e8f00c716d8aae.png",
        "row[images]": "/uploads/20231006/5a749df38287ee6803e8f00c716d8aae.png,/uploads/20231006/a5300d0a66ade70d039c787ec574b0da.png",
        "row[is_score]": "0",
        "row[score_bi]": "",
        "row[is_sku]": "1",
        "row[original_price]": "11.7",
        "row[params]": "[]",
        "row[price]": "5.27",
        "row[cost_price]": "",
        "row[service_ids]": "",
        "row[show_sales]": "",
        "row[store_type]": "0",
        "row[status]": "up",
        "row[gongyingshang]": "沣沛宠物",
        "row[subtitle]": "20MM1004",
        "row[title]": "Silver Feather Cat Stick MOQ 300 pcs",
        "row[title_en]": "",
        "row[title_tw]": "",
        "row[type]": "normal",
        "row[views]": "",
        "row[is_hui]": "0",
        "row[is_pi]": "0",
        "row[weigh]": "",
        "row[weight]": "",
        "row[stock]": "",
        "row[stock_warning_switch]": "false",
        "row[stock_warning]": "",
        "row[sn]": "",
        "row[tm]": "",
        "row[zenggoods_sku_id]": "0",
        "row[autosend_content]": "",
        "row[zenggoods_id]": "",
        "sku[listData]":sku_1,
        "sku[priceData]": sku_2
    }
    return data