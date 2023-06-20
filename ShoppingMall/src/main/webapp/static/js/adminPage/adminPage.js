/**
 * admin.jsp 화면 설정 adminPage
 */


document.addEventListener('DOMContentLoaded', function(){

	// 개발자 화면의 드롭select.option의 value를 확인하고, 표시할 화면 선택

	const menu = document.querySelector('#menu');			

	menu.addEventListener('change', function(){
		const selectedMenu = menu.value;
		selectedContens.innerHTML = "";

		if(selectedMenu=="product"){

			alert(`상품페이지${selectedMenu}`);

			selectedContens.innerHTML = ``;

		}else if(selectedMenu=="user"){

			selectedContens.innerHTML = ``;

		}else if(selectedMenu=="quseries"){

			selectedContens.innerHTML = ``;

		}else if(selectedMenu=="review"){

			selectedContens.innerHTML = `}`;

		}else if(selectedMenu=="post"){

			selectedContens.innerHTML = ``;
		}

	});






});