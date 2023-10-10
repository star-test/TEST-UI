import selenium
from selenium.webdriver.common.by import By
import requests
from bs4 import BeautifulSoup


def file(data_file):
    good_file = {}
    for i in range(1, len(data_file) + 1):
        print(data_file[i])
        ak = {f"img{i}": data_file[i]}
        good_file.update(ak)
    return good_file
# url = 'https://tgsc.qifudaren.net/uLHdDeVJXx.php/general/attachment/index' # 替换为你要抓取的网页地址
# https://tgsc.qifudaren.net/uploads/20231008/d2ad79f8f499bc0d06b8f6ba61dfd2e9.png

# /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[1]/td[4]/div/a/img
def file_se():
    url="https://tgsc.qifudaren.net/uLHdDeVJXx.php/general/attachment/index"
    chk = selenium.webdriver.Firefox()
    chk.get(url)
    chk.implicitly_wait(10)
    o1 = "/html/body/div/div[2]/div[2]/div/div[2]/form/div[1]/input"
    o2 = "/html/body/div/div[2]/div[2]/div/div[2]/form/div[2]/input"
    o3 = "/html/body/div/div[2]/div[2]/div/div[2]/form/div[3]/div/button"
    chk.find_element(By.XPATH, o1).send_keys("star")
    chk.find_element(By.XPATH, o2).send_keys("123456")
    chk.find_element(By.XPATH, o3).click()
    chk.implicitly_wait(10)
    chk.refresh()
    chk.implicitly_wait(10)
    o4="/html/body/div[1]/div/div/div/div/div/div/div[1]/ul/li[8]/a"
    o5="/html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[4]/div[1]/span[2]/span/button"
    o6="/html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[4]/div[1]/span[2]/span/ul/li[5]/a"
    # chk.find_element(By.XPATH, o4).click()
    # chk.implicitly_wait(10)
    # chk.find_element(By.XPATH, o5).click()
    # chk.find_element(By.XPATH, o6).click()
    # chk.implicitly_wait(20)
    #获取
    data={}
    for i in range(1,51):
        a1=" /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[%d]/td[4]/div/a/img"%i
        a2="/html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[%d]/td[5]/div/a"%i
        ab2=chk.find_element(By.XPATH, a2).text
        ab1=chk.find_element(By.XPATH, a1).get_attribute('src')
        k={str(ab2):str(ab1)}
        data.update(k)
    chk.quit()
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[1]/td[4]/div/a/img
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[1]/td[5]/div/a
    return data
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[2]/td[4]/div/a/img
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[2]/td[5]/div/a
def file_re():
    url="https://tgsc.qifudaren.net/uLHdDeVJXx.php/general/attachment/index"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0",
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Cookie": "PHPSESSID=8fctn6876q4m7bevr9g3qjjo48; think_var=zh-cn"
    }
    # data = {"sort": "id", "order": "desc", "offset": "0", "limit": "10", "filter": "{}", "op": "{}",
    #         "_": "1696810338093"}
    response = requests.get(url, headers=headers)
    html = response.content

    # 解析网页内容
    soup = BeautifulSoup(html, 'html.parser')
    img_tags = soup.find_all('div')
    return img_tags,soup

if __name__ == '__main__':
    # print(file_se())
    print(file_re())
