import requests

def code(url):
    res=requests.request("get",url=url)
    print(res.json())
if __name__ == '__main__':
    url=""
    code(url)