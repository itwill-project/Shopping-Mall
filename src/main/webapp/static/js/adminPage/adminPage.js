/**
 * admin.jsp 화면 설정 adminPage
 */


document.addEventListener('DOMContentLoaded', function(){

	// 개발자 화면의 드롭select.option의 value를 확인하고, 표시할 화면 선택

	const menu = document.querySelector('#menu');			
	let product = document.querySelector('div#product').innerHTML;
	let user = document.querySelector('div#user').innerHTML;
	let quseries = document.querySelector('div#quseries').innerHTML;
	let review = document.querySelector('div#review').innerHTML;
	let post = document.querySelector('div#post').innerHTML;
	let selectedContens = document.querySelector('div#selectedContens');

	menu.addEventListener('change', function(){
		const selectedMenu = menu.value;
		selectedContens.innerHTML = "";

		if(selectedMenu=="product"){

			alert(`상품페이지${selectedMenu}`);

			selectedContens.innerHTML = `${product}`;

		}else if(selectedMenu=="user"){

			selectedContens.innerHTML = `${user}`;

		}else if(selectedMenu=="quseries"){

			selectedContens.innerHTML = `${quseries}`;

		}else if(selectedMenu=="review"){

			selectedContens.innerHTML = `${review}`;

		}else if(selectedMenu=="post"){

			selectedContens.innerHTML = `${post}`;
		}

	});






});