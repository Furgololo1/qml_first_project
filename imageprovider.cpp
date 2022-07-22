#include "imageprovider.h"


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
