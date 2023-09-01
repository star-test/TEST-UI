from selenium.webdriver.common.by import By
import selenium

#获取登入的模块
class Test_base_log():

    # 从Firefox登入
    @classmethod
    def loging_url_Firefox(cls,url):
        fixfox = selenium.webdriver.Firefox()
        fixfox.get(url)
        fixfox.implicitly_wait(10)

    # 从chorm登入
    @classmethod
    def loging_url_chrome(cls,url):
        chromes = selenium.webdriver.Chrome()
        chromes.get(url)
        chromes.implicitly_wait(10)
        
