# 处理数据
import pandas as pd
class manage():
    def kehu_name(self):

        return pd.read_excel('data.xlsx', usecols=[0]).values

    def spzl_text_mc(self):
        return pd.read_excel('data.xlsx', usecols=[1]).values

    def spzl_text_id(self):
        return pd.read_excel('data.xlsx', usecols=[2]).values

    def ddht_text_name(self):
        return pd.read_excel('data.xlsx', usecols=[3]).values

    def ddht_text_id(self):
        return pd.read_excel('data.xlsx', usecols=[4]).values
# print(manage().kehu_name())
