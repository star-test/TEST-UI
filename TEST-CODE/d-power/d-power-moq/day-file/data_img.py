import requests
from bs4 import BeautifulSoup

# 请求网页
# url = 'https://tgsc.qifudaren.net/uLHdDeVJXx.php/general/attachment/index' # 替换为你要抓取的网页地址
# https://tgsc.qifudaren.net/uploads/20231008/d2ad79f8f499bc0d06b8f6ba61dfd2e9.png
url="https://tgsc.qifudaren.net/uLHdDeVJXx.php/general/attachment/index?sort=id&order=desc&offset=0&limit=10&filter={}&op={}&_=1696810338093"
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0",
    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
    "Cookie":"PHPSESSID=8fctn6876q4m7bevr9g3qjjo48; think_var=zh-cn"
}
data={"sort":"id","order":"desc","offset":"0","limit":"10","filter":"{}","op":"{}","_":"1696810338093"}
response = requests.get(url,headers=headers)
html = response.content

# 解析网页内容
soup = BeautifulSoup(html, 'html.parser')
img_tags = soup.find_all()


def huoqu(self, a):
    urls = 'https://translate.google.cn/m?sl=auto&tl=en&hl=zh-CN'
    dict = {'q': '%s' % a}
    # print(r.text)
    header = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36 SLBrowser/7.0.0.12151 SLBChan/30'}
    reqe = requests.get(url=urls, params=dict)
    reqe.encoding = 'utf-8'
    # print(reqe.url)
    sopu = BeautifulSoup(reqe.text, 'lxml')
    mu = sopu.select('body > div.root-container > div.result-container')
    for nsk in mu:
        self.netext = nsk.text
    return self.netext

# 获取所有服务器图片链接
for img_tag in img_tags:
    print(img_tag)
    img_url = img_tag.get('src')
    if img_url and img_url.startswith('http'):
        print(img_url)
