#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>

void loadFonts()
{
    QFontDatabase::addApplicationFont(QStringLiteral(":/fonts/Roboto-Bold.ttf"));
    QFontDatabase::addApplicationFont(QStringLiteral(":/fonts/Roboto-Light.ttf"));
    QFontDatabase::addApplicationFont(QStringLiteral(":/fonts/Roboto-Regular.ttf"));
    QFontDatabase::addApplicationFont(QStringLiteral(":/fonts/fontawesome-webfont.ttf"));
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    loadFonts();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
