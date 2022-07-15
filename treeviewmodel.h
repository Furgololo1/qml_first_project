#ifndef TREEVIEWMODEL_H
#define TREEVIEWMODEL_H

#include <QObject>
#include <QStandardItemModel>

class TreeViewModel : public QStandardItemModel
{
    Q_OBJECT
public:
    TreeViewModel(QObject* parent = nullptr);
};

#endif // TREEVIEWMODEL_H
