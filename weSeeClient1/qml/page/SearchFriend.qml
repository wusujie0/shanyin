import Felgo 3.0
import QtQuick 2.0

Page {

    title: "添加"
    id:searchFriendPage

    property string searchContains
    Row{
        id:searchRow
        anchors.top:parent.top
        anchors.topMargin: dp(10)
        AppTextField{
            id:searchFriendText
            placeholderText: "🔍搜索用户名称,ID"
            cursorColor: "yellow"
            maximumLength: 20
            backgroundColor: "lightgrey"                    //背景颜色
            implicitWidth: searchFriendPage.width / 7 * 6        //文本框长度
        }

            AppButton{
                anchors.verticalCenter: searchRow.verticalCenter - dp(0.5)
                id:searchButton
                text: "搜索"
                onClicked: {
                                                          //将搜索框中内容上传至服务器搜索
                }
            }

    }

}
