#ifndef IMAGEMANAGEMENT_H
#define IMAGEMANAGEMENT_H

#include <QObject>
#include <QFileDialog>
#include <QStandardPaths>
#include <QPainter>
#include <QImage>
#include <QRgb>

#include <list>
#include <memory>
#include <algorithm>

#include "imageprovider.h"
#include "datatorestored.h"
#include "ERestoreInfo.h"

class ImageManagement : public QObject
{
    Q_OBJECT

public:
    explicit ImageManagement( QObject *parent = nullptr);

    void setImageProvider(ImageProvider* imgProvider){ imageProvider = imgProvider; }

signals:

public slots:
    void openFileDialog();
    void saveImage();

    void changeR(const int& val);
    void changeG(const int& val);
    void changeB(const int& val);

    void resetRValue();
    void resetGValue();
    void resetBValue();

    void rotateImage(float angle);

    void grayScale();

    void flipImage(bool bVertically);

    void drawTextOnImage(QColor& color, QString fontFamily, int pointSize, Qt::Alignment align, QString text);

    void remove(const int &index);
    void duplicate(const int &index);

    void clearAll();


private:

    void restoreRValue(std::unique_ptr<QList<short>> rList);
    void restoreGValue(std::unique_ptr<QList<short>> gList);
    void restoreBValue(std::unique_ptr<QList<short>> bList);
    void restoreRotatedImage(float angle);
    void restoreRGB(std::unique_ptr<QList<QColor>> rgbList);
    void restoreFlippedImage(bool bVertically);
    void restoreImageAfterInsertingText(QImage& img);

    void mergeTransformationsToImage(std::list<std::pair<DataToRestored,ERestoreInfo>>::iterator it);

    void chooseDataToRestored(std::list<std::pair<DataToRestored,ERestoreInfo>>::iterator it);

    ImageProvider* imageProvider;

    QImage image;

    std::list<std::pair<DataToRestored, ERestoreInfo>> dataList;
    
};

#endif // IMAGEMANAGEMENT_H
