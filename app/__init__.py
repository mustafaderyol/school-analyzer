from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def create_app():
    app = Flask(__name__)
    app.config.from_object('app.config.Config')

    db.init_app(app)

    from app.routes.schools import schools_bp
    from app.routes.answers import answers_bp
    from app.routes.compare import compare_bp
    from app.routes.admin import admin_bp

    app.register_blueprint(schools_bp)
    app.register_blueprint(answers_bp)
    app.register_blueprint(compare_bp)
    app.register_blueprint(admin_bp, url_prefix='/admin')

    return app
