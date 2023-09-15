import pandas as pd
import os.path
import json

def init_fille():
    """读文件"""
    xml_files=[]
    for root, dirs, files in os.walk(os.getcwd()):
        for file in files:
            if os.path.splitext(file)[1] == '.xlsx':
                xml_file = os.path.join(os.getcwd(), file)#文件
                """处理数据"""
                xml_files.append(xml_file)
    return xml_files
def init_dojson(file,datack):
    with open(file, "w+",encoding="utf8") as f:
        json.dump(datack,f,ensure_ascii=False)
        f.close()

def init_duoyy(file,datack,len):
    """处理数据"""
    # print(xml_file)
    if len==0:
        with open(file, "w+", encoding="utf8") as f:
            f.write("中文，English，ภาษาไทย\n{")
            # datack.append(data)
            f.close()
    else:
        with open(file, "a+", encoding="utf8") as f:
            f.write(datack)
            # json.dump(datack,f)
            # datack.append(data)
            f.close()
    if int(len)==842:
        with open(file, "a+", encoding="utf8") as f:
            f.write("}")
            f.close()
def init_cccxc():
    """转换"""

    key=(pd.read_excel(init_fille()[0], usecols=[0]).values)
    en=(pd.read_excel(init_fille()[0], usecols=[1]).values)
    tw=(pd.read_excel(init_fille()[0], usecols=[2]).values)
    zh=(pd.read_excel(init_fille()[0], usecols=[3]).values)
    datas=[]
    for rands in range(len(key)):
        b=[key[rands][0],en[rands][0],tw[rands][0],zh[rands][0]]
        datas.append(b)
        # print(a)
        # time.sleep(3)
        # en_s = {key[rands]: en[rands]}
    # print(a)
    # for k in range(len(datas)):
    #     """txt"""
    #     en_s=str(datas[k][0]+":"+str(datas[k][1])+",")
    #     init_duoyy("en_s.txt", en_s,k)
    #     tw_s=str(datas[k][0]+":"+str(datas[k][2])+",")
    #     init_duoyy("tw_s.txt", tw_s,k)
    #     zh_s=str(datas[k][0]+":"+str(datas[k][3])+",")
    #     init_duoyy("zh_s.txt", zh_s,k)
    en_ss={}
    tw_ss={}
    zh_ss={}
    for k in datas:
        en_s={str(k[0]):str(k[1])}
        en_ss.update(en_s)
        tw_s={str(k[0]):str(k[2])}
        tw_ss.update(tw_s)
        zh_s={str(k[0]):str(k[3])}
        zh_ss.update(zh_s)
    # print(en_ss,tw_ss,zh_ss,)
    init_dojson("en_s.json",en_ss)
    init_dojson("tw_s.json", tw_ss)
    init_dojson("zh_s.json", zh_ss)
        # print(en_s,tw_s,zh_s)

    # with open("en_s.txt","w") as f:
    #     f.write(en_s)
    #     f.close()


if __name__ == '__main__':
    init_cccxc()