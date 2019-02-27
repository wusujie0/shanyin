import VPlayApps 1.0
import QtQuick 2.0

Dialog{
    id:countryPickerDialog
    title: qsTr("国家")
    positiveActionLabel: qsTr("完成")
    negativeActionLabel: qsTr("取消")
    onCanceled: {countryPickerDialog.close()}

}
