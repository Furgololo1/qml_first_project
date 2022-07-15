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

void ImageManagement::changeB()
{
    image.mirror(true, true);
    imageProvider->setImage(image);
}

void ImageManagement::changeR(const int& val)
{
    QColor color;

    for(int x = 0; x <= image.width(); x++){
        for(int y = 0; y <= image.height(); y++){
            color = image.pixelColor(x, y);
            if(color.red() + val > 255)
                color.setRed(255);
            else
                color.setRed(color.red() + val);
            image.setPixelColor(x,y, color);
        }
    }
    imageProvider->setImage(image);
}
