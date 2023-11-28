hamibot.postMessage(Date.now().toString(), {
    telemetry: true,
    data: {
      title: '标题',
      attachments: [
        // 支持 text, json, image 三种类型，根据实际需要选择使用
        {
          type: 'text',
          data: '文字内容',
        },
        {
          type: 'json',
          data: JSON.stringify({
            currentActivity: currentActivity(),
          }),
        },
        {
          type: 'image',
          data: 'data:image/png;base64,iVB...', // base64
        },
      ],
    },
  });
  hamibot.exit();
  