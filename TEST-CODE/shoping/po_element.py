# 元素
#       地址：http://127.0.0.1:8080/shop1/admin/admin_login.jsp
#       用户名/密码：admin/admin
class po_element():
    def url(self):
        return "http://127.0.0.1:8080/shop1/admin/admin_login.jsp"

    def name(self):
        return "admin"

    def pas(self):
        return "admin"

    # 框架
    def iframes(self):
        return "/html/body/center[2]/table/tbody/tr[2]/td/table/tbody/tr/td/iframe"
    def iframe1(self):
        return "/html/frameset/frame[1]"  # name=left

    def iframe2(self):
        return "/html/frameset/frame[2]"  # name=rigth

    # 练习1：测试客户资料搜索
    # 1，用admin/admin登录后台
    def dr_name(self):
        return "/html/body/center/table/tbody/tr[2]/td/form/table/tbody/tr[2]/td[2]/input"

    def dr_pas(self):
        return "/html/body/center/table/tbody/tr[2]/td/form/table/tbody/tr[3]/td[2]/input"

    def dr_qd(self):
        return "/html/body/center/table/tbody/tr[2]/td/form/table/tbody/tr[4]/td[2]/div/input[1]"

    def dr_qx(self):
        return "/html/body/center/table/tbody/tr[2]/td/form/table/tbody/tr[4]/td[2]/div/input[2]"

    # 2，点击客户资料搜索
    # def kehu(self): return "/html/body/table/tbody/tr[2]/td/span/a"
    def iframe1_kehu(self):
        return "/html/body/table/tbody/tr[3]/td/span/a"

    # 3，输入正确的和错误的用户名进行搜索（可以写两个测试用例）
    def iframe2_kehu_input(self):
        return "/html/body/center/form/table/tbody/tr[3]/td/input[1]"

    def iframe2_kehu_click(self):
        return "/html/body/center/form/table/tbody/tr[3]/td/input[2]"
    # 4，断言搜索结果是否正确
    def iframe2_kehu_text(self):
        return "/html/body/center/table/tbody/tr[4]/td[2]"

# 练习2：后台商品资料搜索
    # 1，选择搜索类型
    def iframe1_spzl(self):
        return "/html/body/table/tbody/tr[6]/td/span/a"

    # 2，输入关键字
    def iframe2_spzl_click1(self):
        return "/html/body/center/form/table/tbody/tr[3]/td/select"

    def iframe2_spzl_click1_1(self):
        return "/html/body/center/form/table/tbody/tr[3]/td/select/option[2]"  # 电脑

    def iframe2_spzl_input(self):
        return "/html/body/center/form/table/tbody/tr[3]/td/input[1]"

    # 3，点击搜索按钮
    def iframe2_spzl_click2(self):
        return "/html/body/center/form/table/tbody/tr[3]/td/input[2]"

    # 4，输出结果并断言结果是否正确
    def iframe2_spzl_text_mc_1(self):
        return "/html/body/center/table/tbody/tr[4]/td[1]/span"

    def iframe2_spzl_text_id_1(self):
        return "/html/body/center/table/tbody/tr[4]/td[2]"

# 练习3：后台查看/编辑所有商品


    # 1，点击查看/编辑所有商品
    def iframe1_spht(self):
        return "/html/body/table/tbody/tr[5]/td/span/a"

    # 2，选择一个商品，点击删除功能
    def iframe2_spht_click(self):

        return "/html/body/center/table/tbody/tr[8]/td[4]/span/a"  # 2*4(self): return 12

    # 3，断言是否删除成功
    def iframe2_spht_text_mc_1(self):
        return "/html/body/center/table/tbody/tr[8]/td[1]/span"

    def iframe2_spht_text_id_1(self):
        return "/html/body/center/table/tbody/tr[8]/td[2]/span"


# 练习4：后台查看/编辑所有订单


    # 1，点击查看/编辑所有订单
    def iframe1_ddht(self):
        return "/html/body/table/tbody/tr[9]/td/span/a"

    # 2，选择一个订单，点击删除功能
    def iframe2_ddht_click(self):
        return "/html/body/center/table/tbody/tr[2]/td[6]/span/a"

    # 3，断言是否删除成功
    def iframe2_ddht_text_id(self):
        return "/html/body/center/table/tbody/tr[2]/td[2]"  # 1+1

    def iframe2_ddht_text_name(self):
        return "/html/body/center/table/tbody/tr[2]/td[1]"

