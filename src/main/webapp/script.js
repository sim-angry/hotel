function fn_submit(){
   
		var f = document.frm;	
		
		var v_hotel_id = f.hotel_id.value;
		if(v_hotel_id == ""){
			 	alert("아이디가 입력되지 않았습니다");
	
			f.hotel_id.focus(); return false;
		}
		
		var v_hotel_password = f.hotel_password.value;
		if(v_hotel_password == ""){
			alert("비밀번호가 입력되지 않았습니다!");
			f.hotel_password.focus(); return false;
		}
		
		f.submit();
	
};

function fn_reset(){
	if (confirm("정보를 지우고 처음부터 다시 입력합니다.")) {
		location="LoginForm.jsp";
	}
}