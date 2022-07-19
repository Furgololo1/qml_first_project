#include "imagemanagement.h"

ImageManagement::ImageManagement(QObject *parent)
    : QObject{parent}
{
}

void ImageManagement::saveImage()
{
   image.save(QFileDialog::getSaveFileName(nullptr, tr("Save file"),
                                 QStandardPaths::writableLocation(QStandardPaths::DesktopLocation), tr("Image Files (*.png *.jpg *.jpeg)")));

//    qInfo() << "saving file " << filePath;
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

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

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
    imageProvider->setImage(image);
}

void ImageManagement::changeG(const int& val)
{
    QColor color;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

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
    imageProvider->setImage(image);
}

void ImageManagement::changeB(const int& val)
{
    QColor color;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

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
    imageProvider->setImage(image);
}

void ImageManagement::resetRValue()
{
    QColor color;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            color = image.pixelColor(x, y);
            color.setRed(0);
            image.setPixelColor(x,y, color);
        }
    }
    imageProvider->setImage(image);
}

void ImageManagement::resetGValue()
{
    QColor color;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            color = image.pixelColor(x, y);
            color.setGreen(0);
            image.setPixelColor(x,y, color);
        }
    }
    imageProvider->setImage(image);
}

void ImageManagement::resetBValue()
{
    QColor color;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){
            color = image.pixelColor(x, y);
            color.setBlue(0);
            image.setPixelColor(x,y, color);
        }
    }
    imageProvider->setImage(image);
}

void ImageManagement::rotateImage(const int &angle)
{
    QTransform rotating;
    rotating.rotate(angle);
    image = image.transformed(rotating);
    imageProvider->setImage(image);
}

void ImageManagement::grayScale()
{
    QColor color;

    for(int x = 0; x < image.width(); x++){
        for(int y = 0; y < image.height(); y++){

            color = image.pixelColor(x, y);
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
    imageProvider->setImage(image);

}

void ImageManagement::flipImage(bool bVertically)
{
    QTransform transform;
    if(bVertically)
        image = image.transformed(transform.scale(1,-1));
    //vertically
    else
        image = image.transformed(transform.scale(-1,1));
    //horizontally
    imageProvider->setImage(image);
}

void ImageManagement::test()
{
    QPainter painter;
    painter.begin(&image);
    painter.setPen(QPen(QColor(255,0,0)));
    painter.setFont(QFont("Times", 12, QFont::Bold));

    painter.drawText(image.rect(), Qt::AlignCenter, "Testing text");
    painter.end();

    imageProvider->setImage(image);
}












