#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H

#include <QQuickImageProvider>
#include <QPainter>
#include <QFont>
#include <QTimer>

class ImageProvider: public QQuickImageProvider
{
    Q_OBJECT
public:
    ImageProvider() : QQuickImageProvider(QQuickImageProvider::Image, QQmlImageProviderBase::ForceAsynchronousImageLoading){

    }

    QPixmap requestPixmap(const QString& id, QSize* size, const QSize& requestedSize) override;

    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;

    void setImage(QImage& img);

    QImage& getImage(){ return image; };

private:

    QImage image;

    QTimer timer;
};

#endif // IMAGEPROVIDER_H
