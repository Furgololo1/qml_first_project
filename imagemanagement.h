#ifndef IMAGEMANAGEMENT_H
#define IMAGEMANAGEMENT_H

#include <QObject>
#include <QVariant>
#include <QFileDialog>
#include <QStandardPaths>
#include <QImage>
#include <QRgb>

#include "imageprovider.h"

class ImageManagement : public QObject
{
    Q_OBJECT

public:
    explicit ImageManagement( QObject *parent = nullptr);

    void setImageProvider(ImageProvider* imgProvider){ imageProvider = imgProvider; };

signals:
    void getChoosenFile(QVariant data);

public slots:
    void openFileDialog();

    void saveImage();

    void changeRInImage(const QString& filePath);

    void changeR(const int& val);
    void changeG(const int& val);
    void changeB(const int& val);

    void resetRValue();
    void resetGValue();
    void resetBValue();

    void rotateImage(const int& angle);

    void grayScale();

    void flipImage(bool bVertically);

    void test();



private:

    void changeRValueInImage();

    QString choosenFileName;

    ImageProvider* imageProvider;

    QImage image;
};

#endif // IMAGEMANAGEMENT_H
