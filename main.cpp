#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "textdisplay.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<TextDisplay>("Fitness", 1, 0, "TextDisplay");

    QQmlApplicationEngine engine;
    // engine.loadFromModule("Fitness", "Main");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Fitness", "Main");

    return QGuiApplication::exec();
}
