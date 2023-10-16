import json
import os
import pandas as pd
import numpy as np
import openpyxl
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



def file_w():
    with open('%s.txt'%init_fille()[0][:].split(".")[0][-6:], 'w+', encoding='utf8') as f1:
        try:
            # print(avc[data_if(8390)])
            f1.write("\n")
        except KeyError:
            f1.write("\n")
        print("url")
        f1.close()

# print(init_fille()[0][:].split(".")[0][-6:])
def okpp(data):
    # star=star
    text = np.str_(data)
    if text=='nan':
        text= ""
    else:
       text=(str(data))
    data_text=text.split("\n")
    # if data_text!=[]:
    #     for i in data_text:
    #         star=star+i+","
    # return star
    return data_text

def xxxx():
    workbook=openpyxl.load_workbook(init_fille()[0])
    sheet = workbook['Sheet1']  # 修改为你想要处理的表单名称
    with open('%s222.txt' % init_fille()[0][:].split(".")[0][-6:], 'w+', encoding='utf8') as f1:
        m1=""
        m2=""
        m3=""
        m4=""
        for i in range(2,len(pd.read_excel(init_fille()[0], usecols=[0]).values)+2):
            row1 = sheet.cell(row=i, column=1).value  # 修改为你想要处理的行号和列号
            # 将行数据按照 \n 进行分隔
            row2 = sheet.cell(row=i, column=2).value  # 修改为你想要处理的行号和列号
            row3 = sheet.cell(row=i, column=3).value  # 修改为你想要处理的行号和列号
            row4 = sheet.cell(row=i, column=4).value  # 修改为你想要处理的行号和列号
            row5 = sheet.cell(row=i, column=5).value  # 修改为你想要处理的行号和列号
            row6 = sheet.cell(row=i, column=6).value
            # print(row1)
            a1=okpp(row1)
            a2 = okpp(row2)
            a3 = okpp(row3)
            a4 = okpp(row4)
            a5 = okpp(row5)
            pcl=[]
            lens=0
            stars = ""
            star1 = ""
            star2 = ""
            star3 = ""
            star4 = ""
            if a1 != ['None']:
                pcl.append(a1)
                for i in a1:
                    lens = lens + 1
                    stars = star1 + i + ","
                    if i == a1[-1]:
                        star1 = star1 + i
                    else:
                        star1 = star1 + i + ","
            if a2 != ['None']:
                pcl.append(a2)
                for i in a2:
                    lens = lens + 1
                    stars = star1 + i + ","
                    if i == a2[-1]:
                        star2 = star2 + i
                    else:
                        star2 = star2 + i + ","
            if a3 != ['None']:
                pcl.append(a3)
                for i in a3:
                    lens = lens + 1
                    stars = star1 + i + ","
                    if i == a3[-1]:
                        star3 = star3 + i
                    else:
                        star3 = star3 + i + ","

            if a4!=['None']:
                pcl.append(a4)
                for i in a4:
                    lens = lens + 1
                    stars = stars + i + ","
                    if i == a4[-1]:
                        star4 = star4 + i
                    else:
                        star4 = star4 + i + ","
            if a5!=['None']:
                lens=lens+len(a5)
                pcl.append(a5)
            # print(lens)
            # print(len(pcl))
            # print(lens%len(pcl))
            prices=""
            for ak in range(int(lens/len(pcl))):
                for mmm in pcl:
                    if mmm==pcl[-1]:
                        prices = prices + str(round(float(mmm[ak])*float(row6),2))
                    else:
                        prices =prices+ mmm[ak]+","
                prices = prices+"\n"
            # print(type(row6))
            # print(prices)
                # prices=i[-1]
            if a1[0]==a4[-1]:
                star4=a4[0]
            m1=m1+star1+"\n"
            m2 = m2 + star2 + "\n"
            m3 = m3 + star3 + "\n"
            m4 = m4 + star4 + "\n"
            try:
                # print(avc[data_if(8390)])
                # print(stars)
                # print(prices)
                f1.write(stars)
                f1.write("\n")
                f1.write(prices)
                f1.write("\n")
                f1.write("\n")
            except KeyError:
                f1.write("请换行\n")
                print()

    f1.close()
    print("-------规格--------")
    print(m1)
    print("-------材质--------")
    print(m2)
    print("-------尺寸--------")
    print(m3)
    print("-------颜色--------")
    print(m4)
if __name__ == '__main__':
    # 规格型号  材质	尺寸	颜色	售卖价格	提高多少%
    xxxx()


