function check_name(form)
{
	if(form.c_name.value=="")
	{
		alert("请填写您的用户名!");
		form.c_name.focus();
		return false;
	}
	if(form.c_name.value.length<6 || form.c_name.value.length>20)
	{
		alert("用户名的长度必须在6-20之间！");
		form.c_name.focus();
		return false;
	}
}
function check_info(form)
{
	if(form.c_pass.value=="")
	{
		alert("请填写您的密码!");
		form.c_pass.focus();
		return false;
	}
	if(form.c_pass2.value=="")
	{
		alert("请确认您的密码");
		form.c_pass2.focus();
		return false;
	}
	if(form.c_pass2.value != form.c_pass.value)
	{
		alert("两次密码不一致，请重新填写");
		form.c_pass2.focus();
		return false;
	}
	if(form.c_phone.value=="")
	{
		alert("请输入您的联系电话");
		form.c_phone.focus();
		return false;
	}
	if(form.c_phone.value.length>15)
	{
		alert("错误的电话号码，请重新填写您的电话！");
		form.c_phone.focus();
		return false;
	}
	if(isNaN(form.c_phone.value) || form.c_phone.value.indexOf('.',0)!=-1)
	{
		alert("请不要输入非法字符");
		form.c_phone.focus();
		return false;
	}	
	if(form.c_question.value=="")
	{
		alert("请选择您的问题提示");
		form.c_question.focus();
		return false;
	}
	if(form.c_answer.value=="")
	{
		alert("请填写提示答案");
		form.c_answer.focus();
		return false;
	}
	if(form.c_email.value.indexOf("@")==-1 ||(form.c_email.value.indexOf(".")==-1))
	{
		alert("错误的Email格式，请填写正确的电子邮箱");
		form.c_email.focus();
		return false;
	}
}
