# # # https://tgsc.qifudaren.net/uLHdDeVJXx.php/ajax/upload
# # # Content-Disposition: form-data; name="file"; filename="微信图片_20231006094540.jpg"
# # # Content-Type: image/jpeg
# #
# #
# #
# #
# # {
# #     "code": 1,
# #     "msg": "上传成功",
# #     "data": {
# #         "url": "\/uploads\/20231026\/d92d713d69f7941aff333e6009344e74.jpg",
# #         "fullurl": "https:\/\/tgsc.qifudaren.net\/uploads\/20231026\/d92d713d69f7941aff333e6009344e74.jpg"
# #     },
# #     "url": "",
# #     "wait": 3
# # }
#
#
#
#
#
#
#
# {code: 1, msg: "上传成功", data: {url: "/uploads/20231026/d92d713d69f7941aff333e6009344e74.jpg",…},…}
# code
# :
# 1
# data
# :
# {url: "/uploads/20231026/d92d713d69f7941aff333e6009344e74.jpg",…}
# fullurl
# :
# "https://tgsc.qifudaren.net/uploads/20231026/d92d713d69f7941aff333e6009344e74.jpg"
# url
# :
# "/uploads/20231026/d92d713d69f7941aff333e6009344e74.jpg"
# msg
# :
# "上传成功"
# url
# :
# ""
# wait
# :
# 3



import os
import shutil
import requests

# 设置要读取的文件夹路径和要提取的文件扩展名
def file_img():
    folder_path = os.path.join("%s" % os.path.abspath(
        "../../../../../../新建文件夹/WeChat Files/wxid_jg9aupx4xirf22/FileStorage/File/2023-10/"))
    # print(folder_path)

    # 定义源文件夹和目标文件夹
    source_folder = os.path.join(folder_path, "imgsss")

    # target_folder = os.path.join(folder_path, "img_fi")
    kpdate=[]
    # 遍历源文件夹中的文件
    for filename in os.listdir(source_folder):
        # 检查文件是否为图片
        if filename.endswith('.jpg') or filename.endswith('.jpeg') or filename.endswith('.png'):
            # 读取图片文件名
            # print(os.path.splitext(filename))
            image_name =[os.path.splitext(filename)[0],os.path.splitext(filename)[1]]
            # 检查图片名称是否符合条件（这里用例子里是检查是否包含字符串"example"，您可以根据需要修改条件）
            kpdate.append(image_name)
            # if name in image_name:
            #     # 移动图片到目标文件夹
            #     shutil.move(os.path.join(source_folder, filename), os.path.join(target_folder, filename))
            #     print(name)
    # print(source_folder)
    return kpdate,source_folder
def reimg(files,coolk):
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0",
        "name" :"file",
        "Content-Disposition": "form-data",
        # "Content-Type": "image/jpeg",
        # "Cookie":"jd7l6fs0tl0oi42fdtabduo8qb; think_var=zh-cn"
    }
    url = "https://tgsc.qifudaren.net/uLHdDeVJXx.php/ajax/upload"
    cookies = {
    "PHPSESSID": "jd7l6fs0tl0oi42fdtabduo8qb",
    "think_var": "zh-cn"
    }
    """form-data; name="file"; filename="gettyimages-900089970-612x612.jpg"
    Content-Type: image/jpeg"""
    dpower_re = requests.post(url=url, cookies=cookies,files=files,data=coolk)
    print(dpower_re.json())
    # https://tgsc.qifudaren.net/uLHdDeVJXx.php/ajax/upload
    # Content-Disposition: form-data; name="file"; filename="微信图片_20231006094540.jpg"
    # Content-Type: image/jpeg

if __name__ == '__main__':
    pk,my=file_img()
    for ck in pk:
        pppp=f"{my}/{ck[0]}{ck[1]}"
        with open(pppp, "rb") as f:
            data = {"filename": (pppp,f,f"image/{ck[1][1:]}")}
            pppddd={"Content-Disposition":f"form-data; name=\"file\"; filename=({pppp},{f})"}
            reimg(coolk=pppddd,files=data)
            f.close()
    # reimg()
    # with open(f"{my}/{ck[0]}{ck[1]}", "rb") as f:
    #     data ={"filename":(f"{ck[0]}{ck[1]}",f.read(),f"image/{ck[1][1:]}")}