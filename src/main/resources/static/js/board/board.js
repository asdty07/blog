window.addEventListener('load', function() {
    
    let boardListBody = document.getElementById('board-list-body');

    for (let i of boardList) {
        console.log("Current Data:", i);

        let date = new Date(i.b_date);

        let row = document.createElement('tr');
        row.innerHTML = `
            <td class="b_num"></td>
            <td class="b_name"></td>
            <td><a class="b_title"></a></td>
            <td class="b_date"></td>
            <td><button class="delete-btn">삭제</button></td>
        `;

        boardListBody.appendChild(row);
        
        let b_num = row.querySelector('.b_num');
        let b_name = row.querySelector('.b_name');
        let b_title = row.querySelector('.b_title');
		let b_date = row.querySelector('.b_date');
		let d_btn = row.querySelector('.delete-btn');
        
        // 값이 텍스트로만 표시되어야 하는 경우 innerText 사용
        b_num.innerText = i.b_num;
        b_name.innerText = i.b_name;
        b_title.innerText = i.b_title;
        b_date.innerText = date.toLocaleString();
        
        b_title.addEventListener('click', function(e) {
			let bNum = i.b_num
            window.location.href = '/board/details?bNum=' + bNum;
        });
        
         deleteBtn.addEventListener('click', function(e) {
			let d_bNum = i.b_num
			window.location.href = '/board/delete?bNum=' + d_bNum;
        });
        console.log("Created Row:", row);
    }
});

function boardWrite() {
	window.location.href = '/board/write'
}
