import VPlayApps 1.0
import QtQuick 2.0
import "../controls"
import "../model"

Dialog{
    id:sexPickerDialog
    title: qsTr("性别")
    positiveActionLabel: qsTr("完成")
    negativeActionLabel: qsTr("取消")
    onCanceled: {sexPickerDialog.close()}
    onAccepted: {sexPickerDialog.close()}

    property string sex

    onIsOpenChanged: {
        if(isOpen){
            //当dialog打开时读取之前所设置的性别
        }
    }
    SexPicker{
        id: pickerFrom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 2 * dp(Theme.navigationBar.defaultBarItemPadding)
        height: parent.height
        fontFamily: Theme.normalFont.name
    }


}
