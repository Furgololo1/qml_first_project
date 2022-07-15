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

    void saveFile(const QString& filePath);

    void changeRInImage(const QString& filePath);

    void changeB();
    void changeR(const int& val);

    
private:

    void changeRValueInImage();

    QString choosenFileName;

    ImageProvider* imageProvider;

    QImage image;
};

#endif // IMAGEMANAGEMENT_H
