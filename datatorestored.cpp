#include "datatorestored.h"

DataToRestored::DataToRestored()
{
    qInfo()<<"Constructor";
}

DataToRestored::DataToRestored(DataToRestored &&obj) noexcept
{
    rList = std::move(obj.rList);
    gList = std::move(obj.gList);
    bList = std::move(obj.bList);
    angle = obj.angle;
    rgbList = std::move(obj.rgbList);
    imageBefore = std::move(obj.imageBefore);

    qInfo()<<"Move constructor";
}

DataToRestored::~DataToRestored()
{
    qInfo()<<"Destructor";
}

void DataToRestored::setRList(std::unique_ptr<QList<short>> rListPtr)
{
    rList = std::move(rListPtr);
}

void DataToRestored::setGList(std::unique_ptr<QList<short>> gListPtr)
{
    gList = std::move(gListPtr);
}

void DataToRestored::setBList(std::unique_ptr<QList<short>> bListPtr)
{
    bList = std::move(bListPtr);
}

void DataToRestored::setValue(short &val)
{
    value = val;
}

void DataToRestored::setAngle(float &angl)
{
    angle = angl;
}

void DataToRestored::setRGBList(std::unique_ptr<QList<QColor>> rgbListPtr)
{
    rgbList = std::move(rgbListPtr);
}

void DataToRestored::setImageBeforeInsertingText(QImage img)
{
    imageBefore = img;
}
