# 设置要读取的文件夹路径和要提取的文件扩展名
import os
import shutil
def file_img(name):
    folder_path = os.path.join("%s" % os.path.abspath("./"))
    # print(folder_path)

    # 定义源文件夹和目标文件夹
    source_folder = os.path.join(folder_path, "../../../d-power-up-down/d-power-file-img-re/imgsss")
    target_folder = os.path.join(folder_path, "../../../d-power-up-down/d-power-file-img-re/img_fi")

    # 遍历源文件夹中的文件
    for filename in os.listdir(source_folder):
        # 检查文件是否为图片
        if filename.endswith('.jpg') or filename.endswith('.jpeg') or filename.endswith('.png'):
            # 读取图片文件名
            image_name = os.path.splitext(filename)[0]
            # 检查图片名称是否符合条件（这里用例子里是检查是否包含字符串"example"，您可以根据需要修改条件）
            if name in image_name:
                # 移动图片到目标文件夹
                shutil.move(os.path.join(source_folder, filename), os.path.join(target_folder, filename))
                print(name)
if __name__ == '__main__':
    name=['75696', '73302', '76396', '72916', '73722', '72480', '73586', '73395', '73401']
    for i in name:
        file_img(i)