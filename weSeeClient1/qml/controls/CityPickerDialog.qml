import VPlayApps 1.0
import QtQuick 2.0

Dialog {
    id:cityPickerDialog
    title:qsTr("城市")
    positiveActionLabel: qsTr("完成")
    negativeActionLabel: qsTr("取消")
    onCanceled: {cityPickerDialog.close()}

    property string city

    onIsOpenChanged: {
        if(isOpen){
                                                //当dialog打开时读取之前所设置的性别
        }
    }
    ListView{

    }

}
