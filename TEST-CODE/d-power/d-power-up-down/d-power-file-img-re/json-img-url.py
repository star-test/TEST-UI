import json
import os
import pandas as pd
import numpy as np
def init_fille():
    """读文件"""
    xml_files = []
    for root, dirs, files in os.walk(os.getcwd()):
        for file in files:
            if os.path.splitext(file)[1] == '.json':
                xml_file = os.path.join(os.getcwd(), file)  # 文件
                """处理数据"""
                xml_files.append(xml_file)
    return xml_files
def ok_json():
    abc=[]
    for i in init_fille():
        with open('%s' % i, 'r', encoding='utf8') as fp:
            json_data = json.load(fp)
            abc.append(json_data)
                # print(jb)
            # print('这是文件中的json数据：', json_data)
            # print('这是读取到文件数据的数据类型：', type(json_data))
            fp.close()
    return abc
def panck():
    data=ok_json()
    # jjj = "https://tgsc.qifudaren.net"
    jjj=""
    abc={}
    for i in data:
        for m in i["rows"]:
            jb = {str(m["id"]): jjj + m["url"]}
            # jb = {str(m["filename"]).replace("." + str(m["imagetype"]), ""): jjj + m["url"]}
            abc.update(jb)
    return abc
def data_if(text):

    text1=np.str_(text)
    if text1=='nan':
        return ""
    else:
        return (str(text1))
def ok_panck():
    avc=panck()
    """读文件"""
    xml_files = []
    for root, dirs, files in os.walk(os.getcwd()):
        for file in files:
            if os.path.splitext(file)[1] == '.xlsx':
                xml_file = os.path.join(os.getcwd(), file)  # 文件
                """处理数据"""
                xml_files.append(xml_file)
    imgs = (pd.read_excel(xml_files[0], usecols=[0]).values)
    bc_id=0
    kkkkk=[]
    with open('%s.txt'%xml_files[0], 'w+', encoding='utf8') as f1:
        f1.write("imgs_files\n")
        for img in imgs:
            for img in imgs:
                try:
                    # print(avc[data_if(8390)])
                    bc_id = bc_id + 1
                    print(bc_id, avc[data_if(img[0])])
                    f1.write(avc[data_if(img[0])])
                    f1.write("\n")
                except KeyError:
                    # print(data_if(img[0]))
                    f1.write("0\n")
                    kkkkk.append(data_if(img[0]))
            f1.close()
        print(kkkkk)
if __name__ == '__main__':

    # avc=panck()
    # print(avc[0]["8309"])
    ok_panck()
    # print(1)
