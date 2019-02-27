import VPlayApps 1.0
import QtQuick 2.5
import "../controls"

ListPage {
    id:editInformationPage
    title: "编辑个人资料"

    model: [
        {text:"昵称",color:"white",page:Qt.resolvedUrl("EditNickName.qml")},
        {text:"签名",color:"white",page:Qt.resolvedUrl("EditSign.qml")},

        {text:"性别",color:"white",dialog:sexPickerDialog},
        {text:"生日",color:"white",dialog:birthdayPickerDialog},
        {text:"地区",color:"white",page:Qt.resolvedUrl("EditRegion.qml")}
    ]

    onItemSelected: {
        if(index <= 1 || index > 3){
            editInformationPage.navigationStack.push(model[index].page)  //切换界面
        }
        else{
            model[index].dialog.open()    //打开dialog

        }

    }
    
   SexPickerDialog{id:sexPickerDialog}
//   SexComboBox{id:sexComboBox}
   BirthdayPickerDialog{id:birthdayPickerDialog}

}
