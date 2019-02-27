import VPlayApps 1.0
import QtQuick 2.0

Dialog {

    id: birthdayPickerDialog
    title: qsTr("生日")
    positiveActionLabel: qsTr("完成")
    negativeActionLabel: qsTr("取消")
    onCanceled: {birthdayPickerDialog.close()}

}
