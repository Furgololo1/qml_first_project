#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H

#include <QQuickImageProvider>

class ImageProvider: public QQuickImageProvider
{
    Q_OBJECT
public:
    ImageProvider() : QQuickImageProvider(QQuickImageProvider::Image, QQmlImageProviderBase::ForceAsynchronousImageLoading){

    }


    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;

    void setImage(QImage& img);

    //QImage& getImage(){ return image; };

private:

    QImage image;

};

#endif // IMAGEPROVIDER_H
