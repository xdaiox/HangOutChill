<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
    <!-- 可以成功傳送ajax請求，並接收 -->
<meta charset="UTF-8">
<title>Ajax Page</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp" />
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">
<h1>Ajax Page</h1>
<form id="msgForm" action="#">
    <input id="discussions" type="text" required>
    <input id="normalMember" type="text" required>

    <button id="submitBtn">送出</button>
</form>


<div>
    <table class="mytable" id="list_table_json">
        <thead>
            <tr>
                <th>收藏文章id</th>
                <th>收藏使用者id</th>
                <th>收藏</th>
                <th><i class="far fa-star"><i class="fas fa-star"></i></i></th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

</div>

<script>
    $(document).ready(function(){
        $('#submitBtn').click(function(event){
            event.preventDefault();
            let inputDsId = document.getElementById('discussions').value;
            let inputNMId = document.getElementById('normalMember').value;
            let dtoObject = {
                                "discussions": {
                                    "d_id": inputDsId
                                },
                                "normalMember": {
                                    "id" : inputNMId
                                }
                            }
            let dtoJsonString = JSON.stringify(dtoObject);

            $.ajax({
                url:'http://localhost:8080/hangoutchill/api/addFavourite/post',
                contentType:"application/json;charset=UTF-8",
                dataType: 'json',
                method:'post',
                data:dtoJsonString,
                success:function(result){
                    console.log(result)
                    
                    msg_data = '<tbody>';
                    $.each(result,function(index,value){
                        msg_data += '<tr>'
                        msg_data += '<td>' + value.discussions + '</td>'
                        msg_data += '<td>' + value.normalMember + '</td>'
                        msg_data += '<td >' + '<i class="far fa-star"></i>'+ '</td>'
                        msg_data += '</tr>'
                    })
                    msg_data += '</tbody>';

                    let myTable = document.getElementById('list_table_json');
                    myTable.getElementsByTagName('tbody')[0].innerHTML = msg_data

                    },
                error:function(err){
                    console.log(err)
                }
            })


        })
    })


</script>

</body>
</html>