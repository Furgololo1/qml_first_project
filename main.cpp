#include <QApplication>
#include <QQmlApplicationEngine>
#include <QSharedPointer>

#include <QQmlContext>
#include "imagemanagement.h"
#include "imageprovider.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ImageProvider imageProvider;
    ImageManagement imageManagement;
    imageManagement.setImageProvider(&imageProvider);

    engine.rootContext()->setContextProperty("ImageManagement", &imageManagement);

    engine.addImageProvider("imageProvider", &imageProvider);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
