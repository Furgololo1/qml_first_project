#include "imagemanagement.h"

ImageManagement::ImageManagement(QObject *parent)
    : QObject{parent}
{
}

void ImageManagement::saveFile(const QString& filePath)
{
    QFileDialog::getSaveFileName(nullptr, tr("Save file"), 
                    QStandardPaths::writableLocation(QStandardPaths::DesktopLocation), tr("Image Files (*.png *.jpg *.jpeg)"));

    qInfo() << "saving file " << filePath;
}

void ImageManagement::openFileDialog()
{
    choosenFileName = QFileDialog::getOpenFileName(nullptr, tr("Choose image"),
                      QStandardPaths::writableLocation(QStandardPaths::PicturesLocation), tr("Image Files(*.png *.jpg *.jpeg)"));

    image = QImage(choosenFileName);

    imageProvider->setImage(image);

   // emit getChoosenFile(QVariant(choosenFileName));
}

void ImageManagement::changeRInImage(const QString& filePath)
{

}

void ImageManagement::changeR(const int& val)
{
    QColor color;

    for(int x = 0; x <= image.width(); x++){
        for(int y = 0; y <= image.height(); y++){

            color = image.pixelColor(x, y);

            if(color.red() + val > 255)
                color.setRed(255);
            else if(color.red() + val < 0)
                color.setRed(0);
            else
                color.setRed(color.red() + val);

            image.setPixelColor(x,y, color);

        }
    }
    qInfo() << "change R, value: " << val;
    imageProvider->setImage(image);
}

void ImageManagement::changeG(const int& val)
{
    QColor color;

    for(int x = 0; x <= image.width(); x++){
        for(int y = 0; y <= image.height(); y++){

            color = image.pixelColor(x, y);

            if(color.green() + val > 255)
                color.setGreen(255);
            else if(color.green() + val < 0)
                color.setGreen(0);
            else
                color.setGreen(color.green() + val);

            image.setPixelColor(x,y, color);

        }
    }
    qInfo() << "change G, value: " << val;
    imageProvider->setImage(image);
}

void ImageManagement::changeB(const int& val)
{
     QColor color;

    for(int x = 0; x <= image.width(); x++){
        for(int y = 0; y <= image.height(); y++){

            color = image.pixelColor(x, y);

            if(color.blue() + val > 255)
                color.setBlue(255);
            else if(color.blue() + val < 0)
                color.setBlue(0);
            else
                color.setBlue(color.blue() + val);

            image.setPixelColor(x,y, color);

        }
    }
    qInfo() << "change B, value: " << val;
    imageProvider->setImage(image);
}
