import json
import os.path
import time
import re
import xmltodict
import pandas as pd


def init_fille():
    """读文件"""
    xml_files=[]
    for root, dirs, files in os.walk(os.getcwd()):
        for file in files:
            if os.path.splitext(file)[1] == '.json':
                xml_file = os.path.join(os.getcwd(), file)#文件
                """处理数据"""
                xml_files.append(xml_file)
    return xml_files


def init_duoyy(file,datack):
    """处理数据"""
    # print(xml_file)
    with open(file, "r",encoding="utf8") as f:
        data = json.load(f)
        datack.append(data)
        f.close()

def init_cop():
    """数据"""
    data=[]
    for  file in init_fille():
        init_duoyy(file,data)
    # print(data)
    # 英文 泰语 中文
    en=data[0]
    tw=data[1]
    zh=data[2]
    datas=[]
    # for i in data:
    #     if "en.json" in data[i]:
    #         en=data[i]
    #     elif  "tw.json" in data[i]:
    #         tw=data[i]
    #     elif  "zh-cn.json" in data[i]:
    #         zh=data[i]

    for e in en:
        ak=[e,en[e],tw[e],zh[e]]
        datas.append(ak)
    columns = ["key", "英语", "泰语","简体", ]
    dt = pd.DataFrame(datas, columns=columns)
    dt.to_excel("keymy.xlsx", index=0)  # xlsx

if __name__ == '__main__':
    init_cop()
    # init_cccxc()