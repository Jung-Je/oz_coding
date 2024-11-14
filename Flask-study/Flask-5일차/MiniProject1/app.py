from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# 임시 사용자 데이터
users = [
    {"username": "그저 빛", "name": "파멘"},
    {"username": "맥주 퀸", "name": "수멘"},
    {"username": "백엔드 최강 미남", "name": "상멘"}
]

@app.route('/')
def index():
    return render_template('index.html', users=users)

# 사용자 추가, 수정, 삭제 라우트 및 함수 작성...
@app.route('/add', methods=['GET', 'POST'])
def add_user():
    # 사용자 추가 뷰
    if request.method == 'POST':
        username = request.form['username']
        name = request.form['name']
        users.append({'username': username, 'name': name})
        return redirect(url_for('index'))  # redirect로 수정
    return render_template('add_user.html')

@app.route('/edit/<username>', methods=['GET', 'POST'])  # 'methods'로 수정
def edit_user(username):
    # 사용자 수정 뷰
    user = next((user for user in users if user['username'] == username), None)  # 'user[username]' -> 'user['username']' 수정
    if not user:
        return redirect(url_for('index'))
    
    if request.method == 'POST':
        user['name'] = request.form['name']
        return redirect(url_for('index'))  # POST 후 리다이렉트
        
    return render_template('edit_user.html', user=user)  # 들여쓰기 수정

@app.route('/delete/<username>')
def delete_user(username):
    # 사용자 삭제 뷰
    global users
    users = [user for user in users if user['username'] != username]
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
