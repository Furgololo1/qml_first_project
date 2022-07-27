#ifndef DATATORESTORED_H
#define DATATORESTORED_H

#include <QImage>
#include <QColor>
#include <QDebug>
#include <memory>

#include "ERestoreInfo.h"

class DataToRestored
{
public:
    DataToRestored();
    DataToRestored(ERestoreInfo newRestoreInfo);
//    DataToRestored(const DataToRestored& obj);
    DataToRestored(DataToRestored &&obj) noexcept;

    DataToRestored& operator =(const DataToRestored& obj){
//        rList = std::move(obj.rList);
//        gList = std::move(obj.gList);
//        bList = std::move(obj.bList);
//        angle = obj.angle;
//        rgbList = std::move(obj.rgbList);
//        imageBefore = std::move(obj.imageBefore);
//        restoreInfo = obj.restoreInfo;

        qInfo()<<"= operator";
        return const_cast<DataToRestored&>(obj);
    }

    ~DataToRestored();

    void setRList(std::unique_ptr<QList<short>> rListPtr);
    void setGList(std::unique_ptr<QList<short>> gListPtr);
    void setBList(std::unique_ptr<QList<short>> bListPtr);
    void setValue(short& val);

    void setAngle(float &angl);

    void setRGBList(std::unique_ptr<QList<QColor>> rgbListPtr);

    void setImageBeforeInsertingText(QImage img);


    std::unique_ptr<QList<short>> getRList(){ return std::move(rList); }
    std::unique_ptr<QList<short>> getGList(){ return std::move(gList); }
    std::unique_ptr<QList<short>> getBList(){ return std::move(bList); }
    short getValue(){ return value; }

    float getAngle(){ return angle; }

    std::unique_ptr<QList<QColor>> getRGBList(){return std::move(rgbList); }

    QImage &getImageBeforeInsertingText(){ return imageBefore; }

    ERestoreInfo getRestoreInfo() const;

private:

    ERestoreInfo restoreInfo;

    short value;

    std::unique_ptr<QList<short>> rList;
    std::unique_ptr<QList<short>> gList;
    std::unique_ptr<QList<short>> bList;

    float angle;

    std::unique_ptr<QList<QColor>> rgbList;

    QImage imageBefore;
};

#endif // DATATORESTORED_H
