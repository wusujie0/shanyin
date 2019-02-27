import VPlayApps 1.0
import QtQuick 2.0

Page {

    title: person
    property string person

    property var newMsgs: []

    property int numRepeats: 1

    readonly property int numLoadedItem: blindTextMsgs.length

    property var blindTextMsgs : []

    Rectangle{
        height: px(1)
        anchors.bottom: inputBox.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#cccccc"
    }

    AppTextField{
        id:inputBox
        height: dp(48)
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: dp(8)
        anchors.rightMargin: dp(8)
        font.pixelSize: sp(16)
        placeholderText: "发送消息...."      //当输入框为空时显示
        backgroundColor: "white"
        verticalAlignment: Text.AlignHCenter

        onAccepted: {
            newMsgs = newMsgs.concat({me:true,text:inputBox.text})
            inputBox.text = ""    //发送后为空
            listView.positionViewAtEnd()

        }
    }

}
