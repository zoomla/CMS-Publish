window.onload = () => {
    let Batch_DeleteLog = document.getElementById("Batch_DeleteLog");
    let DeleteLogs = document.getElementsByClassName("DeleteLog");
    
    let GetLogId = function(elenent){
        let Subling = elenent.parentElement.parentElement.childNodes[3]; 
        return parseInt(Subling.innerHTML.trim());
    }

    for(let i=0;i<DeleteLogs.length;i++){
        DeleteLogs[i].onclick= ()=>{
            let prompt = "你确定要删除此条日志吗？";
            if(confirm(prompt) == false){
                return ; 
            }
            let LogId =  GetLogId(DeleteLogs[i]); 
            if((typeof(LogId)=="number")== false){
                alert("ID错误"); 
                return ;
            } 
            $.ajax({
                type: "DELETE",
                url: "/Admin/User/Mail/SMSSendLog/"+LogId,
                success: function (response) {
                    location.reload();
                },
                Error: function(){
                    alert("删除Log失败");
                }
            });

        };
    }
    
    Batch_DeleteLog.onclick = () => {
        if(confirm("你确定要删除这些日志吗？") == false){
            return ; 
        }
        let SMSIDs = [];
        let selects = document.getElementsByClassName("Select");
        // 拿到所有要删除的的ID
        for (var i = 0; i < selects.length; i++) {
            // 复选框 ✔
            if (selects[i].checked == true) {
                // 找出兄弟节点
                let LogId = GetLogId(selects[i]);
                if((typeof(LogId)=="number")== false){
                    alert("ID错误"); 
                    return ;
                } 
                SMSIDs.push(LogId);
            }
        }
        if(SMSIDs.length <1){
            alert("未选择日志！！！");
            return ; 
        }
        $.ajax({
            type: "DELETE",
            url: "/Admin/User/Mail/SMSSendLog",
            contentType:"application/json",
            data: JSON.stringify(SMSIDs),
            success: function (response) {
                location.reload();
            },
            Error: function(){
                console.log(" Data Send Error");
            }
        });
    }

}