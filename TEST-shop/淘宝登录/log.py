# -*- coding: utf-8 -*-

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

"/html/body/div[3]/div/div[2]/div[2]/div[1]/div/div[2]/div[5]/div/div/div[1]/div/div/div[9]/div/span"
"/html/body/div[3]/div/div[2]/div[2]/div[1]/div/div[2]/div[5]/div/div/div[1]/div[1]/div/div[6]/div"
# 定义一个taobao类
class taobao_infos():

    # 对象初始化
    def __init__(self):
        # 浏览器启动选项
        option = webdriver.FirefoxOptions()
        # 指定为无界面模式
        option.add_argument('--headless')
        # option.headless=True  或者将上面的语句换成这条亦可
        # 创建Chrome驱动程序的实例
        self.driver = webdriver.Firefox(options=option)
        self.driver.maximize_window()
        self.driver.get()
    # 登录淘宝
    def login(self):
        # 打开网页
        self.browser.get(self.url)

        # 等待 密码登录选项 出现
        password_login = self.wait.until(
            EC.presence_of_element_located((By.CSS_SELECTOR, '.qrcode-login > .login-links > .forget-pwd')))
        password_login.click()

        # 等待 微博登录选项 出现
        weibo_login = self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, '.weibo-login')))
        weibo_login.click()

        # 等待 微博账号 出现
        weibo_user = self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, '.username > .W_input')))
        weibo_user.send_keys(weibo_username)

        # 等待 微博密码 出现
        weibo_pwd = self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, '.password > .W_input')))
        weibo_pwd.send_keys(weibo_password)

        # 等待 登录按钮 出现
        submit = self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, '.btn_tip > a > span')))
        submit.click()

        # 直到获取到淘宝会员昵称才能确定是登录成功
        taobao_name = self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR,
                                                                      '.site-nav-bd > ul.site-nav-bd-l > li#J_SiteNavLogin > div.site-nav-menu-hd > div.site-nav-user > a.site-nav-login-info-nick ')))
        # 输出淘宝昵称
        print(taobao_name.text)


# 使用教程：
# 1.下载chrome浏览器:https://www.google.com/chrome/
# 2.查看chrome浏览器的版本号，下载对应版本号的chromedriver驱动:http://chromedriver.storage.googleapis.com/index.html
# 3.填写chromedriver的绝对路径
# 4.执行命令pip install selenium
# 5.打开https://account.weibo.com/set/bindsns/bindtaobao并通过微博绑定淘宝账号密码

if __name__ == "__main__":
    chromedriver_path = "/Users/bird/Desktop/chromedriver.exe"  # 改成你的chromedriver的完整路径地址
    weibo_username = "改成你的微博账号"  # 改成你的微博账号
    weibo_password = "改成你的微博密码"  # 改成你的微博密码

    a = taobao_infos()
    a.login()  # 登录