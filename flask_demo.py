from flask import Flask,render_template,request


app = Flask(__name__)

@app.route("/",methods=['GET'])
def welcome():
    return "<h1>Welcome to the API service</h1>"

@app.route("/index",methods=['GET'])
def index():
    return "<h2>Welcome to index page</h2>"

@app.route("/success/<int:score>")
def success(score):
    return "The score is : " + str(score)

@app.route("/form",methods=['GET',"POST"])
def form():
    if request.method == 'GET':
        return render_template('form.html')


if __name__ == "__main__":
    app.run(debug=True)