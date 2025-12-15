import secrets
import urllib
from flask import Flask, request, session, redirect, render_template, url_for, json
from routes.routes import rutas
from models.db_mdl import get_db, Usuario, valida_usuario

# Claves reCAPTCHA entregadas por el usuario
RECAPTCHA_SITE_KEY = "MI_RECAPTCHA_SITE_KEY"
RECAPTCHA_SECRET_KEY = "MI_RECAPTCHA_SECRET_KEY"

app = Flask(__name__, template_folder='templates')
app.register_blueprint(rutas, url_prefix="/api")
app.secret_key = secrets.token_hex(24)

@app.route("/")
def index():
    if "user_id" in session:
        return redirect(url_for("dashboard"))

    return render_template("login.html", site_key=RECAPTCHA_SITE_KEY)

@app.route("/login", methods=["GET", "POST"])
def login():
    msg_out = ""

    if "user_id" in session:
        return redirect(url_for("dashboard"))

    if request.method == "POST":
        usrnm = request.form["username"]
        passwd = request.form["password"]
        recaptcha_response = request.form.get("g-recaptcha-response")

        if not recaptcha_response:
            msg_out = "Debe resolver el CAPTCHA para continuar."
        else:
            # Validación reCAPTCHA (Google)
            verify_url = "https://www.google.com/recaptcha/api/siteverify"

            data = urllib.parse.urlencode({
                "secret": RECAPTCHA_SECRET_KEY,
                "response": recaptcha_response
            }).encode()

            req = urllib.request.Request(verify_url, data=data)
            response = urllib.request.urlopen(req)
            result = json.loads(response.read().decode())

            if not result.get("success"):
                msg_out = "Error de verificación reCAPTCHA."

        user = valida_usuario(usrnm, passwd)

        if user and recaptcha_response:
            usrNfo = user.to_dict()

            session["user_id"] = usrNfo["id"]
            session["api_key"] = usrNfo["api_key"]
            return redirect(url_for("dashboard"))

    return render_template("login.html", message=msg_out, site_key=RECAPTCHA_SITE_KEY)

@app.route("/logout")
def logout():
    try:
        with get_db() as db:
            user = db.query(Usuario).filter(Usuario.id == session["user_id"]).first()

            if user:
                user.api_key = ""

            db.commit()

            session.pop("user_id", None)
            return redirect(url_for("index"))
    except Exception as e:
        return {"error": str(e)}

@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")

if __name__ == "__main__":
    app.run(debug=True)
