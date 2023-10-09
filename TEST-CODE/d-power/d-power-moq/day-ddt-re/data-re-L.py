


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



