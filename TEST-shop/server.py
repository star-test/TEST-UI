
import os
import json
from flask import Flask, render_template
from tqdm import tqdm
import time
print("Starting server")
#网页的后端交互
app = Flask(__name__)   
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    # app.run(host='0.0.0.0', port=8080, debug=True)
    for i in tqdm(range(1000)):
        time.sleep(0.001)
