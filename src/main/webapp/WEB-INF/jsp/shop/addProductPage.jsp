<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>新增產品頁面</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>

<body>
<div class="container-scroller">
<jsp:include page="../dbLayout/top_navbar.jsp" />
<div class="container-fluid page-body-wrapper">
<jsp:include page="../dbLayout/left_navbar.jsp" />
<div class="container">

		<div class="row justify-content-center">
			<h2>請輸入產品資料：</h2>
			<form:form method="post" action="${contextRoot}/shop/postProduct"
				modelAttribute="product" enctype="multipart/form-data">
				<table class="table">
					<!-- 					<tr> -->
					<!-- 						<td><span>*</span> <label for="proid" class="t1">產品編號 -->
					<!-- 								:</label> -->
					<!-- 							<p>(產品編號為全數字)</p></td> -->
					<!-- 						<td><input type="text" name="proid" id="proid" /> <span -->
					<!-- 							id="iderror" class="error"> </span><span id="idcorrect" -->
					<!-- 							class="correct"></span></td> -->
					<!-- 					</tr> -->
          			<tr>
						<td><span>*</span> <label for="proname">產品名稱 :</label></td>
						<td><form:input name="proname" id="proname"
								path="productName" /><span id="nerror" class="error"></span><span
							id="ncorrect" class="correct"></span></td>
					</tr>
					<tr>
						<td><span>*</span> <label for="category">產品分類 :</label></td>
						<td><form:select name="category" id="category"
								path="category">
								<form:option value="-1" label="請選擇..." />
								<form:option value="實用嚴選" label="實用嚴選" />
								<form:option value="美味嚐點" label="美味嚐點" />
								<form:option value="文創商品" label="文創商品" />
							</form:select><span id="catgerror" class="error"></span><span id="catgcorrect"
							class="correct"></span></td>
					</tr>
					<tr>
						<td><span>* </span><label for="content">產品描述 :</label></td>
						<td><form:textarea type="text" name="content" id="content"
								cols="30" rows="10" path="productDesc" /><span id="contenterror"
							class="error"></span><span id="contentcorrect" class="correct"></span></td>
					</tr>
					<tr>
						<td><span>* </span><label for="content">產品規格 :</label></td>
						<td><form:input type="text" name="content" id="content"
								path="productSpec" /><span id="contenterror" class="error"></span><span
							id="contentcorrect" class="correct"></span></td>
					</tr>
					<tr>
						<td><span>* </span><label for="unitprice">單價(NTD) :</label></td>
						<td><form:input type="text" name="unitprice" id="unitprice"
								path="unitPrice" /><span id="prierror" class="error"></span><span
							id="pricorrect" class="correct"></span></td>
					</tr>
					<tr>
						<td><span>* </span><label for="discount"> 折扣 :</label><br />
							<p class="p1">(請填入0~1之間的數值)</p></td>
						<td><form:input type="text" name="discount" id="discount"
								path="discount" /><span id="dserror" class="error"></span><span
							id="dscorrect" class="correct"></span></td>
					</tr>
					<tr>
						<td><span>* </span><label for="launchdate">上架日期:</label></td>
						<td><form:input type="date" name="launchdate" id="launchdate"
								path="launchdate" /><span id="dateerror" class="error"></span><span
							id="datecorrect" class="correct"></span></td>
					</tr>
					<tr>
						<td>商品封面圖片：</td>
						<td><form:input type="file" path="mainImage" /><br /></td>
					</tr>
					<tr>
						<td>商品圖片：</td>
						<td id="dadtd"><input type="button" value="+ 圖片" id="addfile" /><br />
							<form:input type="file" name="extraphoto" path="" /><br /></td>
					</tr>
				</table>
				<input type="submit" value="送出" id="submit" /> <a
							href="${contextRoot}/shop/allproducts"><input type="button" value="取消" /></a>
			</form:form>
			</div>
			
</div>
</div>
</div>
	<script>
      // 動態新增上傳圖片
      let addfile = document.getElementById("addfile");
      let i = 2;
      addfile.addEventListener("click", function () {
        let dadtd = document.getElementById("dadtd");
        let addinput = document.createElement("input");
        let addbr = document.createElement("br");
        addinput.setAttribute("type", "file");
        addinput.setAttribute("name", "extraphoto");
        i++;
        dadtd.appendChild(addinput);
        dadtd.appendChild(addbr);
      });

      // 標籤格式確認
      // binding
      document.getElementById("proid").addEventListener("blur", checkId);
      document.getElementById("proname").addEventListener("blur", checkName);
      document
        .getElementById("category")
        .addEventListener("blur", checkCategory);
      document.getElementById("content").addEventListener("blur", checkContent);
      document
        .getElementById("unitprice")
        .addEventListener("blur", checkUniprice);
      document
        .getElementById("discount")
        .addEventListener("blur", checkDiscount);
      document.getElementById("launchdate").addEventListener("blur", checkDate);

      let theSumit = document.getElementById("submit");
      theSumit.addEventListener("click", function (event) {
        if (flag1 || flag2 || flag3 || flag4 || flag5 || flag6 || flag7) {
          event.preventDefault();
          alert("輸入資訊有誤或有欄位未輸入！");
        }
      });

      // Product ID check effect
      let flag1 = true;
      function checkId() {
        let theIdObj = document.getElementById("proid");
        let theIdObjVal = theIdObj.value;
        let spError = document.getElementById("iderror");
        let spCorrect = document.getElementById("idcorrect");
        let theIdObjValLen = theIdObjVal.length;
        if (theIdObjValLen == "") {
          spError.innerHTML = "欄位不可空白";
          spCorrect.innerHTML = "";
          flag1 = true;
        } else {
          for (let i = 0; i < theIdObjValLen; i++) {
            let chCode = theIdObjVal.charCodeAt(i);
            if (chCode < 0x30 || chCode > 0x39) {
              spError.innerHTML = "請輸入0~9的數字";
              spCorrect.innerHTML = "";
              flag1 = true;
              break;
            } else {
              spError.innerHTML = "";
              spCorrect.innerHTML = "  <img src='correct.png'>";
              flag1 = false;
            }
          }
        }
      }

      // Product name check
      let flag2 = true;
      function checkName() {
        let theNameObj = document.getElementById("proname");
        let theNameObjVal = theNameObj.value;
        let nError = document.getElementById("nerror");
        let nCorrect = document.getElementById("ncorrect");
        if (theNameObjVal == "") {
          nError.innerHTML = "欄位不可空白";
          nCorrect.innerHTML = "";
          flag2 = true;
        } else {
          nError.innerHTML = "";
          nCorrect.innerHTML = "  <img src='correct.png'>";
          flag2 = false;
        }
      }

      // Product Category check

      let flag3 = true;
      function checkCategory() {
        let theCategoryObj = document.getElementById("category");
        // let theCategoryObjVal = theCategoryObj.value;
        let catgError = document.getElementById("catgerror");
        let catgCorrect = document.getElementById("catgcorrect");
        if (this.value == "請選擇...") {
          catgError.innerHTML = "請選擇一個產品分類";
          catgCorrect.innerHTML = "";
          flag3 = true;
        } else {
          catgError.innerHTML = "";
          catgCorrect.innerHTML = "  <img src='correct.png'>";
          flag3 = false;
        }
      }

      // Product content check
      let flag4 = true;
      function checkContent() {
        let theContentObj = document.getElementById("content");
        let theContentObjVal = theContentObj.value;
        let contentError = document.getElementById("contenterror");
        let contentCorrect = document.getElementById("contentcorrect");
        if (theContentObjVal == "") {
          contentError.innerHTML = "欄位不可空白";
          contentCorrect.innerHTML = "";
          flag4 = true;
        } else {
          contentError.innerHTML = "";
          contentCorrect.innerHTML = "  <img src='correct.png'>";
          flag4 = false;
        }
      }

      // Product price check
      let flag5 = true;
      function checkUniprice() {
        let thePriceObj = document.getElementById("unitprice");
        let thePriceObjVal = thePriceObj.value;
        let thePriceObjValLen = thePriceObjVal.length;
        let priError = document.getElementById("prierror");
        let priCorrect = document.getElementById("pricorrect");
        if (thePriceObjVal == "") {
          priError.innerHTML = "欄位不可空白";
          priCorrect.innerHTML = "";
          flag5 = true;
        } else {
          for (let i = 0; i < thePriceObjValLen; i++) {
            let chCode = thePriceObjVal.charCodeAt(i);
            if (chCode < 0x30 || chCode > 0x39) {
              priError.innerHTML = "請輸入數字";
              priCorrect.innerHTML = "";
              flag5 = true;
              break;
            } else {
              priError.innerHTML = "";
              priCorrect.innerHTML = "  <img src='correct.png'>";
              flag5 = false;
            }
          }
        }
      }

      // Product discount check
      let flag6 = true;
      function checkDiscount() {
        let theDsObj = document.getElementById("discount");
        let theDsObjVal = theDsObj.value;
        let dsError = document.getElementById("dserror");
        let dsCorrect = document.getElementById("dscorrect");
        if (theDsObjVal == "") {
          dsError.innerHTML = "欄位不可空白";
          dsCorrect.innerHTML = "";
          flag6 = true;
        } else {
          if (theDsObjVal <= 1 && theDsObjVal > 0) {
            dsError.innerHTML = "";
            dsCorrect.innerHTML = "  <img src='correct.png'>";
            flag6 = false;
          } else {
            dsError.innerHTML = "請輸入0~1，且大於0的數值";
            dsCorrect.innerHTML = "";
            flag6 = true;
          }
        }
      }

      // check date
      let flag7 = true;
      function checkDate() {
        let theDateObj = document.getElementById("launchdate");
        let theDateObjVal = theDateObj.value;
        let dateError = document.getElementById("dateerror");
        let dateCorrect = document.getElementById("datecorrect");
        if (theDateObjVal == "") {
          dateError.innerHTML = " 請選擇日期";
          dateCorrect.innerHTML = "";
          flag7 = true;
        } else {
          dateError.innerHTML = "";
          dateCorrect.innerHTML = "";
          flag7 = false;
        }
      }
    </script>
</body>
</html>


