window.onload = function() {
    // 화면이 로드되었을 때 실행할 코드
    let  mode = document.getElementById("mode").value;
    const urlParams = new URLSearchParams(window.location.search);
    const selectedValue1 = urlParams.get('c_name1'); // 선택된 옵션 값
    const selectedValue2 = urlParams.get('c_name2'); // 선택된 옵션 값
    const resultValue = urlParams.get('cost'); // 결과 값
    const joindate1Value = urlParams.get('joinfrdate'); // 시작 날짜
    const joindate2Value = urlParams.get('jointodate'); // 종료 날짜
    const selectElement1 = document.getElementById("c_name1");
    
    if ((mode === "rese_car_update") || (mode === "rese_hotel_update")) {
      document.getElementById("mod_reseno").value = urlParams.get("mod_reseno");
   }
    
   
    let selectElement2;
    if ((mode === "rese_car_insert") ||(mode === "rese_car_update")) {
      selectElement2 = document.getElementById("c_name2");   
   }else {
      selectElement2 = document.querySelectorAll('input[name="c_name2"]');   
   }
    const resultElement = document.getElementById("result");
    const joindate1Element = document.getElementById("joindate1");
    const joindate2Element = document.getElementById("joindate2"); // 수정된 부분

    if (resultValue) {
        resultElement.value = resultValue;
        joindate1Element.value = joindate1Value; // 시작 날짜 대입
        joindate2Element.value = joindate2Value; // 종료 날짜 대입

        // 모든 옵션 중에서 파라미터 값과 일치하는 옵션 찾기
        for (let option of selectElement1.options) {
            if (option.value === selectedValue1) {
                option.selected = true; // 일치하는 경우 selected 속성 추가
                break; // 일치하는 값을 찾으면 루프 종료
            }
            
        }

        if ((mode === "rese_car_insert") ||(mode === "rese_car_update")) {
         for (let option of selectElement2.options) {
            if (option.value === selectedValue2) {
               option.selected = true;
               break;
            }  
         }
      } else {
         for (let radio of selectElement2) {
            if (radio.value === selectedValue2) {
               radio.checked = true;
               break;
            }
         }
      } 

    }
} 

function fn_calulate() {
    var f = document.frm;
    var param1, param2, param3, param5, param6, param8;
    
    let  mode = document.getElementById("mode").value;
    if ((mode === "rese_car_insert") || (mode === "rese_car_update")) {
       param1 = "02";
       param3 = document.getElementById('c_name2').value;
    } else {
       param1 = "01";
       param3 = document.querySelector('input[name="c_name2"]:checked').value;
    } 
    param2 = document.getElementById('c_name1').value;
    param5 = document.getElementById('joindate1').value;
    param6 = document.getElementById('joindate2').value;
    
    if ((mode === "rese_car_update") || (mode === "rese_hotel_update")) {
      param8 = document.getElementById('mod_reseno').value;
   }

    // 예약장소 체크
    if (param2 === "") {
        alert("예약장소가 선택되지 않았습니다");
        f.c_name1.focus(); 
        return false;
    }

    // 자동차 체크
    if (param3 === "") {
       if ((mode === "rese_car_insert") || (mode === "rese_car_update")) {
          alert("자동차 종류가 선택되지 않았습니다.");
           f.c_name2.focus();
      }else{
         alert("숙박인원이 선택되지 않았습니다..");
      }
        return false;
    }
    const date1 = new Date(param5);
    const date2 = new Date(param6);

    // 날짜 유효성 체크
    if (isNaN(date1.getTime()) || isNaN(date2.getTime())) {
        alert("유효하지 않은 날짜입니다."); // 날짜 입력 오류 메시지
        return false;
    }

    const differenceInTime = date2 - date1; // 밀리초 단위 차이
    const differenceInDays = Math.ceil(differenceInTime / (1000 * 3600 * 24)); // 일 단위로 변환

    // 날짜 차이에 따른 경고
    if (differenceInDays === 0) {
        alert("당일치기는 불가능합니다.");
        return false;
    } else if (differenceInDays < 0) {
        alert("체크인 날짜가 이후일 수 없습니다");
        return false;
    }
    
    document.getElementById('result').value = '';

    // 폼 생성 및 전송
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'cost.jsp';

    // 파라미터 추가
    var inputs = [
        { name: 'param1', value: param1 },
        { name: 'param2', value: param2 },
        { name: 'param3', value: param3 },
        { name: 'param4', value: differenceInDays },
        { name: 'param5', value: param5 },
        { name: 'param6', value: param6 },
        { name: 'param7', value: mode }
    ];
    

   if ((mode === "rese_hotel_update") || (mode === "rese_car_update")) {
      inputs.push({ name: 'param8', value: param8 });
   }

    inputs.forEach(inputData => {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = inputData.name;
        input.value = inputData.value;
        form.appendChild(input);
    });

    document.body.appendChild(form);
    form.submit();
}

function fn_reset(){
   
   let  mode = document.getElementById("mode").value;
   
   if (confirm("정보를 지우고 처음부터 다시 입력합니다.")) {
      switch (mode) {
          case "rese_car_insert":
              location = "car.jsp";
              break;
          case "rese_car_update":
              location = "modify_car.jsp";
              break;
          case "rese_hotel_insert":
              location = "reserve.jsp";
              break;
          case "rese_hotel_update":
              location = "modify.jsp";
              break;
          default:
              // 추가적인 처리가 필요하다면 여기에 작성
              break;
      }      
   }
}