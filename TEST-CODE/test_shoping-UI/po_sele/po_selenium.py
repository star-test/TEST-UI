# BaseCommon 封装元素操作方法和页面操作方法
# methodConfig 存放元素定位
# methodRead 存放元素读取
# testCase 测试用例文档
from selenium import webdriver
from selenium.webdriver.common.by import By
#处理关于wep页面操作
class po_page():
    def __init__(self):
        self.der = webdriver.Firefox()
        self.der.maximize_window()
    def dres_url(self,url):
        return self.der.get(url)
    def dres_click(self,input):
        return self.der.find_element(By.XPATH,input).click()
    def dres_send_kend(self,input,send):
        self.der.find_element(By.XPATH, input).clear()
        return self.der.find_element(By.XPATH,input).send_keys(send)
    def dres_alert_accept(self):#确定弹窗
        return self.der.switch_to.alert.accept()
    def dres_alert_text(self):
        return self.der.switch_to.alert.text  # 获取弹窗信息
    def dres_iframe(self,iframe):
        return self.der.switch_to.frame(self.der.find_element(By.XPATH,iframe))#切换框架
    def dres_iframe_defa(self):
        self.der.switch_to.default_content()#返回主页面
    def dres_quit(self):
        self.der.quit()
    def dres_input_text(self,input):
        return self.der.find_element(By.XPATH, input).text
    def dres_input(self,input):
        return self.der.find_element(By.XPATH, input)
    def dres_refresh(self):
        return self.der.refresh()
    def dres_imp_win(self):
        return self.der.implicitly_wait(5)
    def dres_title(self):#标签
        return self.der.title
    def dres_scrollto(self):#滚
        js = "window.scrollTo(0,500);"
        return self.der.execute_script(js)
    def dres_text(self):
        return self.der.page_source