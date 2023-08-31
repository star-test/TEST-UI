import po_selenium
import po_element
#page
class myserver():
    def __init__(self):
        self.ders=po_selenium.po_page()
        self.elem=po_element.po_element()
    #主页
    def get_url(self):
        return self.ders.dres_url(self.elem.url())
    def sent_names(self):
        return self.ders.dres_send_kend(self.elem.dr_name(),self.elem.name())
    def sent_pas(self):
        return self.ders.dres_send_kend(self.elem.dr_pas(),self.elem.pas())
    def click_qd(self):
        return self.ders.dres_click(self.elem.dr_qd())
    # 练习1：测试客户资料搜索
    def click_kehu(self):
        return self.ders.dres_click(self.elem.iframe1_kehu())
    def click_kehu_input(self,inputs):
        return self.ders.dres_send_kend(self.elem.iframe2_kehu_input(),inputs)
    def click_kehu_click(self):
        return self.ders.dres_click(self.elem.iframe2_kehu_click())
    def text_kehu_name(self):
        return self.ders.dres_input_text(self.elem.iframe2_kehu_text())
    # 练习2：后台商品资料搜索
    def click_spzl(self):
        return self.ders.dres_click(self.elem.iframe1_spzl())
    def click_spzl_click1(self):
        return self.ders.dres_click(self.elem.iframe2_spzl_click1())
    def click_spzl_click_xlk(self):
        return self.ders.dres_click(self.elem.iframe2_spzl_click1_1())
    def click_spzl_input(self,inputs):
        return self.ders.dres_send_kend(self.elem.iframe2_spzl_input(),inputs)
    def click_spzl_click2(self):
        return self.ders.dres_click(self.elem.iframe2_spzl_click2())
    def text_spzl_mc(self):
        return self.ders.dres_input_text(self.elem.iframe2_spzl_text_mc_1())
    def text_spzl_id(self):
        return self.ders.dres_input_text(self.elem.iframe2_spzl_text_id_1())
    # 练习3：后台查看/编辑所有商品
    def refresh(self):
        return self.ders.dres_refresh()
    def click_spht(self):
        return self.ders.dres_click(self.elem.iframe1_spht())
    def click_spht_click(self):
        return self.ders.dres_click(self.elem.iframe2_spht_click())
    def text_spht_mc(self):
        return self.ders.dres_input_text(self.elem.iframe2_spht_text_mc_1())
    def text_spht_id(self):
        return self.ders.dres_input_text(self.elem.iframe2_spht_text_id_1())
    # 练习4：后台查看/编辑所有订单
    def click_ddht(self):
        return self.ders.dres_click(self.elem.iframe1_ddht())
    def click_ddht_click(self):
        return self.ders.dres_click(self.elem.iframe2_ddht_click())
    def text_ddht_name(self):
        return self.ders.dres_input_text(self.elem.iframe2_ddht_text_name())
    def text_ddht_id(self):
        return self.ders.dres_input_text(self.elem.iframe2_ddht_text_id())
    #qi
    def altel_text(self):
        a=self.ders.dres_alert_text()
        self.ders.dres_alert_accept()
        return a
    def iferms(self):
        return self.ders.dres_iframe(self.elem.iframes())

    def iferm1(self):
        return self.ders.dres_iframe(self.elem.iframe1())

    def iferm2(self):
        return self.ders.dres_iframe(self.elem.iframe2())

    def iferms_back(self):
        return self.ders.dres_iframe_defa()



