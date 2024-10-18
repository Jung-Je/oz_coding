const form = document.getElementById("form")

form.addEventListener("submit", function(event){
    event.preventDefault() // 기존 기능 차단

    let userId = event.target.id.value.trim();
    let userPw1 = event.target.pw1.value.trim();
    let userPw2 = event.target.pw2.value.trim();
    let userName = event.target.name.value.trim();
    let userEmail = event.target.email.value.trim();
    let userGender = event.target.gender.value
    let userPhone = event.target.phone.value.trim();

    // 유효성 검사 패턴
    const idPattern = /^[a-zA-Z0-9]{6,20}$/; // 6~20자 영문, 숫자
    const pwPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$/; // 영문, 숫자, 특수문자 포함 8~30자
    const phonePattern = /^[0-9]{1,15}$/; // 전화번호 15자 이내 숫자만
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/; // 이메일 형식

    // 유효성 검사
    if (!idPattern.test(userId)) {
        alert("아이디는 6자 이상 20자 이하의 영문과 숫자로 입력하세요.");
        return;
    }
    if (!pwPattern.test(userPw1)) {
        alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8자 이상 30자 미만이어야 합니다.");
        return;
    }
    if (userPw1 !== userPw2) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }
    if (userName.length > 30) {
        alert("이름은 30자 이내로 입력하세요.");
        return;
    }
    if (!phonePattern.test(userPhone)) {
        alert("전화번호는 숫자만 15자 이내로 입력하세요.");
        return;
    }
    if (!emailPattern.test(userEmail) || userEmail.length > 35) {
        alert("유효한 이메일을 35자 이내로 입력하세요.");
        return;
    }

    alert(`환영합니다.
    아이디 : ${userId}
    이메일 : ${userEmail}
    이름 : ${userName}
    전화번호 : ${userPhone}
    성별 : ${userGender}
    `)

})


const button = document.getElementById('toggle-theme');
button.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
});