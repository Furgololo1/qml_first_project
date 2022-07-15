#include "imageprovider.h"

QPixmap ImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(id)
    Q_UNUSED(size)
    Q_UNUSED(requestedSize)
        int width = 100;
        int height = 100;

        QPixmap pixmap(width, height);

        return pixmap;
}

QImage ImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(id)
    Q_UNUSED(size)
    Q_UNUSED(requestedSize)
    return image;
}

void ImageProvider::setImage(QImage& img)
{
    image = img;
}
