const form = document.getElementById("form")

form.addEventListener("submit", function(event){
    event.preventDefault() // 기존 기능 차단

    let userId = event.target.id.value
    let userName = event.target.name.value
    let userEmail = event.target.email.value

    alert(`환영합니다.
    아이디 : ${userId}
    이메일 : ${userEmail}`)

})