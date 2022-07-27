#include "imagemanagement.h"

ImageManagement::ImageManagement(QObject *parent)
    : QObject{parent}
{
}

void ImageManagement::saveImage()
{
   image.save(QFileDialog::getSaveFileName(nullptr, tr("Save file"),
                                 QStandardPaths::writableLocation(QStandardPaths::DesktopLocation), tr("Image Files (*.png *.jpg *.jpeg)")));

}

void ImageManagement::openFileDialog()
{
    QString choosenFileName = QFileDialog::getOpenFileName(nullptr, tr("Choose image"),
                                                   QStandardPaths::writableLocation(QStandardPaths::PicturesLocation), tr("Image Files(*.png *.jpg *.jpeg)"));

    image = QImage(choosenFileName);

    imageProvider->setImage(image);

}

void ImageManagement::changeR(const int& val)
{
    QColor color;

    std::unique_ptr<QList<short>> rValueList = std::make_unique<QList<short>>(QList<short>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            rValueList->push_back(color.red());

            if(color.red() + val > 255)
                color.setRed(255);
            else if(color.red() + val < 0)
                color.setRed(0);
            else
                color.setRed(color.red() + val);

            image.setPixelColor(x, y, color);

        }
    }

    DataToRestored data(ERestoreInfo::RValue);
    data.setRList(std::move(rValueList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::changeG(const int& val)
{
    QColor color;

    std::unique_ptr<QList<short>> gValueList = std::make_unique<QList<short>>(QList<short>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            gValueList->push_back(color.green());

            if(color.green() + val > 255)
                color.setGreen(255);
            else if(color.green() + val < 0)
                color.setGreen(0);
            else
                color.setGreen(color.green() + val);

            image.setPixelColor(x,y, color);

        }
    }

    DataToRestored data(ERestoreInfo::GValue);
    data.setGList(std::move(gValueList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::changeB(const int& val)
{
    QColor color;

    std::unique_ptr<QList<short>> bValueList = std::make_unique<QList<short>>(QList<short>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            bValueList->push_back(color.blue());

            if(color.blue() + val > 255)
                color.setBlue(255);
            else if(color.blue() + val < 0)
                color.setBlue(0);
            else
                color.setBlue(color.blue() + val);

            image.setPixelColor(x,y, color);

        }
    }

    DataToRestored data(ERestoreInfo::BValue);
    data.setBList(std::move(bValueList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::resetRValue()
{
    QColor color;

    std::unique_ptr<QList<short>> rValueList = std::make_unique<QList<short>>(QList<short>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            color = image.pixelColor(x, y);
            rValueList->push_back(color.red());

            color.setRed(0);
            image.setPixelColor(x,y, color);
        }
    }

    DataToRestored data(ERestoreInfo::RValue);
    data.setRList(std::move(rValueList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::resetGValue()
{
    QColor color;

    std::unique_ptr<QList<short>> gValueList = std::make_unique<QList<short>>(QList<short>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            color = image.pixelColor(x, y);
            gValueList->push_back(color.green());

            color.setGreen(0);
            image.setPixelColor(x,y, color);
        }
    }

    DataToRestored data(ERestoreInfo::GValue);
    data.setGList(std::move(gValueList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::resetBValue()
{
    QColor color;

    std::unique_ptr<QList<short>> bValueList = std::make_unique<QList<short>>(QList<short>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            color = image.pixelColor(x, y);
            bValueList->push_back(color.blue());

            color.setBlue(0);
            image.setPixelColor(x,y, color);
        }
    }

    DataToRestored data(ERestoreInfo::BValue);
    data.setBList(std::move(bValueList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::rotateImage(float angle)
{
    QTransform rotating;
    rotating.rotate(angle);
    image = image.transformed(rotating);

    DataToRestored data(ERestoreInfo::Angle);
    data.setAngle(angle);

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::grayScale()
{
    QColor color;

    std::unique_ptr<QList<QColor>> rgbList = std::make_unique<QList<QColor>>(QList<QColor>());

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            rgbList->push_back(color);

            if(color.red() >= color.blue() && color.red() >= color.green()){
                color.setBlue(color.red());
                color.setGreen(color.red());
            }

            else if(color.green() >= color.blue() && color.green() >= color.red()){
                color.setBlue(color.green());
                color.setRed(color.green());
            }

            else if(color.blue() >= color.red() && color.blue() >= color.green()){
                color.setGreen(color.blue());
                color.setRed(color.blue());
            }


            image.setPixelColor(x,y, color);

        }
    }

    DataToRestored data(ERestoreInfo::RGB);
    data.setRGBList(std::move(rgbList));

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);

}

void ImageManagement::flipImage(bool bVertically)
{
    QTransform transform;
    if(bVertically){                //vertically
        image = image.transformed(transform.scale(1,-1));
        dataArray.push_back(DataToRestored(DataToRestored(ERestoreInfo::FlippedVertically)));
    }

    else{                           //horizontally
        image = image.transformed(transform.scale(-1,1));
        dataArray.push_back(DataToRestored(DataToRestored(ERestoreInfo::FlippedHorizontally)));
    }

    imageProvider->setImage(image);
}

void ImageManagement::drawTextOnImage(QColor& color, QString fontFamily, int pointSize, Qt::Alignment align, QString text)
{
    DataToRestored data(ERestoreInfo::TextOnImage);
    data.setImageBeforeInsertingText(image);

    QPainter painter;
    painter.begin(&image);
    painter.setPen(QPen(color));
    painter.setFont(QFont(fontFamily, pointSize, QFont::Bold));
    painter.drawText(image.rect(), align, text);
    painter.end();

    dataArray.push_back(DataToRestored(std::move(data)));

    imageProvider->setImage(image);
}

void ImageManagement::remove(const int &index)
{

    std::vector<DataToRestored>::iterator it = dataArray.begin();
    std::advance(it, index);

    switch(it->getRestoreInfo()){
    case RValue:
        restoreRValue(std::move(it->getRList()));
        break;
    case GValue:
        restoreGValue(std::move(it->getGList()));
        break;
    case BValue:
        restoreBValue(std::move(it->getBList()));
        break;
    case RGB:
        restoreRGB(std::move(it->getRGBList()));
        break;
    case Angle:
        restoreRotatedImage(it->getAngle());
        break;
    case FlippedHorizontally:
        restoreFlippedImage(false);
        break;
    case FlippedVertically:
        restoreFlippedImage(true);
        break;
    case TextOnImage:
        restoreImageAfterInsertingText(it->getImageBeforeInsertingText());
        imageProvider->setImage(image);
        break;
    }

    dataArray.erase(it);

}

void ImageManagement::duplicate(const int &index)
{
    std::vector<DataToRestored>::iterator it = dataArray.begin();
    std::advance(it, index);

    switch(it->getRestoreInfo()){
    case RValue:
        changeR(it->getValue());
        break;
    case GValue:
        changeG(it->getValue());
        break;
    case BValue:
        changeB(it->getValue());
        break;
    case Angle:
        rotateImage(it->getAngle());
        break;
    case FlippedHorizontally:
        flipImage(false);
        break;
    case FlippedVertically:
        flipImage(true);
        break;
    }
}

void ImageManagement::clearAll()
{
    dataArray.clear();

}

void ImageManagement::restoreRValue(std::unique_ptr<QList<short>> rList)
{
    QColor color;

    long int i = 0;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            color.setRed(rList.get()->at(i));

            image.setPixelColor(x, y, color);
            i++;
        }
    }

    imageProvider->setImage(image);
}

void ImageManagement::restoreGValue(std::unique_ptr<QList<short>> gList)
{
    QColor color;

    long int i = 0;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            color.setGreen(gList.get()->at(i));

            image.setPixelColor(x, y, color);
            i++;
        }
    }

    imageProvider->setImage(image);
}

void ImageManagement::restoreBValue(std::unique_ptr<QList<short>> bList)
{
    QColor color;

    long int i = 0;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
            color.setBlue(bList.get()->at(i));

            image.setPixelColor(x, y, color);
            i++;
        }
    }

    imageProvider->setImage(image);

}

void ImageManagement::restoreRotatedImage(float angle)
{
    QTransform rotating;
    rotating.rotate(-angle);
    image = image.transformed(rotating);

    imageProvider->setImage(image);
}

void ImageManagement::restoreRGB(std::unique_ptr<QList<QColor> > rgbList)
{
    QColor color;
    long int i = 0;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            image.setPixelColor(x,y, rgbList.get()->at(i));
            i++;
        }
    }

    imageProvider->setImage(image);
}

void ImageManagement::restoreFlippedImage(bool bVertically)
{
    QTransform transform;
    if(bVertically){                //vertically
        image = image.transformed(transform.scale(-1,-1));
    }

    else{                           //horizontally
        image = image.transformed(transform.scale(-1,-1));
    }

    imageProvider->setImage(image);
}

void ImageManagement::restoreImageAfterInsertingText(QImage &img)
{
    image = img;
}















