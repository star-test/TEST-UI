def list_spilst(data):
    abds=data.split(",")
    return abds

def list_children(color,size,mqr,modble,sku_if):
    add_file_moble=[]
    add_file_color=[]
    add_file_size =[]
    add_file_mqr = []
    modble=list_spilst(modble)
    color = list_spilst(color)
    size = list_spilst(size)
    mqr = list_spilst(mqr)
    # print(color)
    sku_len=len(modble)+len(color),len(size),len(mqr)
    a_modble={"Modble":modble}
    b_color={"Color":color}
    c_size={"Size":size}
    d_mqr={"MQR":mqr}
    if modble!=[]:
        for dilid in range(0, len((color))):
            # print(dilid,color[dilid])
            afile = {"id": 0, "temp_id": dilid+4, "name": color[dilid], "pid": 0}
            add_file_color.append(afile)
    if color!=[]:
        for dilid in range(0, len((color))):
            # print(dilid,color[dilid])
            afile = {"id": 0, "temp_id": dilid+4, "name": color[dilid], "pid": 0}
            add_file_color.append(afile)
    if size!=[]:
        for dilid in range(len(size)):
            afile = {"id": 0, "temp_id":len(color)+4+dilid, "name": size[dilid], "pid": 0}
            add_file_size.append(afile)
    if mqr!=[]:
        for dilid in range(len(mqr)):
            afile = {"id": 0, "temp_id":len(color)+4+dilid+len(size), "name": mqr[dilid], "pid": 0}
            add_file_mqr.append(afile)
    all_file=[add_file_color,add_file_size,add_file_mqr,add_file_moble]
    return all_file

if __name__ == '__main__':
    color="color1,color2"
    size="size1,size2,size3"
    mqr=""
    modble="modble555"
    sku_if="[color1,size1,moble555,89.99]\n[color2,size2,moble555,89.99],[color1,size2,moble555,89.99],[color1,size3,moble555,89.99]"
    print(sku_if.split("\n"))


