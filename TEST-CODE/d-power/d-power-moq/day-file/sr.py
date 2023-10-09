import selenium
from selenium.webdriver.common.by import By

# url="https://tgsc.qifudaren.net/uLHdDeVJXx.php/general/attachment"
#
# # /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[1]/td[4]/div/a/img
# # /html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[2]/td[4]/div/a/img
# chk=selenium.webdriver.Firefox()
# chk.get(url)
# chk.implicitly_wait(10)
# o1="/html/body/div/div[2]/div[2]/div/div[2]/form/div[1]/input"
# o2= "/html/body/div/div[2]/div[2]/div/div[2]/form/div[2]/input"
# o3= "/html/body/div/div[2]/div[2]/div/div[2]/form/div[3]/div/button"
# chk.find_element(By.XPATH,o1).send_keys("star")
# chk.find_element(By.XPATH,o2).send_keys("123456")
# chk.find_element(By.XPATH,o3).click()
# chk.implicitly_wait(10)
# chk.refresh()
# chk.implicitly_wait(10)
# a="/html/body/div[1]/div/div/div/div/div/div/div[2]/div/div/div/div[1]/div[3]/div[2]/table/tbody/tr[2]/td[4]/div/a/img"
# text=chk.find_element(By.XPATH,a).text
# print(text)
# chk.quit()
web=selenium.webdriver.Firefox()
url="https://tgsc.qifudaren.net/uLHdDeVJXx.php/shopro/category"
web.get(url)

a="/html/body/div/div/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div[1]/div/div[1]/span"
a2="/html/body/div/div/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div[1]/div/div[2]/div[2]/div[1]/input"
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div/div[1]/span
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div/div[1]/span
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div/div[1]
# /html/body/div[1]/div/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div/div[2]/div[2]/div[1]/input