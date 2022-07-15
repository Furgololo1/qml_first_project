#include "treeviewmodel.h"
#include <QStandardItem>

TreeViewModel::TreeViewModel(QObject* parent)
    : QStandardItemModel(parent)
{
    setColumnCount(1);
    QStandardItem* rootItem = invisibleRootItem();

    QStandardItem *group1 = new QStandardItem;
    QStandardItem *group2 = new QStandardItem;
    QStandardItem *group3 = new QStandardItem;

    QStandardItem *value1 = new QStandardItem;
    QStandardItem *value2 = new QStandardItem;
    QStandardItem *value3 = new QStandardItem;
    QStandardItem *value4 = new QStandardItem;
    QStandardItem *value5 = new QStandardItem;
    QStandardItem *value6 = new QStandardItem;
    QStandardItem *value7 = new QStandardItem;
    QStandardItem *value8 = new QStandardItem;
    QStandardItem *value9 = new QStandardItem;

    group1->setText("Group 1");
    group2->setText("Group 2");
    group3->setText("Group 3");

    value1->setText("Value 1");
    value2->setText("Value 2");
    value3->setText("Value 3");
    value4->setText("Value 4");
    value5->setText("Value 5");
    value6->setText("Value 6");
    value7->setText("Value 7");
    value8->setText("Value 8");
    value9->setText("Value 9");

    group1->appendRow(value1);
    group1->appendRow(value2);
    group1->appendRow(value3);

    group2->appendRow(value4);
    group2->appendRow(value5);
    group2->appendRow(value6);

    group3->appendRow(value7);
    group3->appendRow(value8);
    group3->appendRow(value9);

    rootItem->appendRow(group1);
    rootItem->appendRow(group2);
    rootItem->appendRow(group3);

}
