<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>新增產品頁面</title>
<style>
	label{
		margin:20px 0px;
	}
	
	span.error {
        color: red;
        font-size: 85%;
      }

      span.correct {
        color: green;
        font-size: 85%;
      }
</style>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>

<body>
	<div class="container-scroller">
		<jsp:include page="../dbLayout/top_navbar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../dbLayout/left_navbar.jsp" />
			<div class="container">

				<div class="content_box" style="width: 100%">


					<h3 style="text-align: center;">請輸入欲新增產品資訊：</h3>
          <span ><button type="button" class="btn btn-primary btn-sm" id="demoBtn">Demo</button></span> 
					<div class="content"
						style="background-color: #ffffff00; height: 100%">
						<div class="col-12" style="margin: auto">
							<div class="card">
								<div class="card-body">

									<form:form method="post"
										action="${contextRoot}/shop/postProduct"
										modelAttribute="product" enctype="multipart/form-data">
										<p>
											<span>*</span> <label for="proname">產品名稱 :</label>
										</p>
										<form:input name="proname" id="proname" path="productName"
											class="form-control" />
										<span id="nerror" class="error"></span>
										<span id="ncorrect" class="correct"></span>
										<p>
											<span>*</span> <label for="category">產品分類 :</label>
										</p>
										<form:select name="category" id="category"
											class="form-control" path="category">
											<form:option value="-1" label="請選擇..." />
											<form:option value="實用嚴選" label="實用嚴選" />
											<form:option value="美味嚐點" label="美味嚐點" />
											<form:option value="文創商品" label="文創商品" />
										</form:select>
										<span id="catgerror" class="error"></span>
										<span id="catgcorrect" class="correct"></span>
										<p>
											<span>* </span><label for="descrp">產品描述 :</label>
										</p>
										<form:textarea type="text" name="descrp" id="descrp"
											class="form-control" cols="30" rows="10" path="productDesc" />
										<span id="descterror" class="error"></span>
										<span id="desccorrect" class="correct"></span>
										<p>
											<span>* </span><label for="content">產品規格 :</label>
										</p>
										<form:textarea type="text" name="content" id="content"
											class="form-control" cols="30" rows="10" path="productSpec" />
										<span id="contenterror" class="error"></span>
										<span id="contentcorrect" class="correct"></span>
										<p>
											<span>* </span><label for="unitprice">單價(NTD) :</label>
										</p>
										<form:input type="text" name="unitprice" id="unitprice"
											class="form-control" path="unitPrice" />
										<span id="prierror" class="error"></span>
										<span id="pricorrect" class="correct"></span>
										<p>
											<span>* </span><label for="discount"> 折扣 :</label><br />
										<p class="p1">(請填入0~1之間的數值)</p>
										<form:input type="text" name="discount" id="discount"
											class="form-control" path="discount" />
										<span id="dserror" class="error"></span>
										<span id="dscorrect" class="correct"></span>
										<p>
											<span>* </span><label for="launchdate">上架日期:</label>
										</p>
										<form:input type="date" name="launchdate" id="launchdate"
											class="form-control" path="launchdate" />
										<span id="dateerror" class="error"></span>
										<span id="datecorrect" class="correct"></span>
										<p style="margin-top:20px;">商品封面圖片：</p>
										<form:input type="file" path="mainImage" class="form-control" />
										<p style="margin-top:20px;">商品圖片：</p>
										<div id="dadtd">
											<input type="button" value="+ 圖片" id="addfile" /><br />
											<form:input type="file" name="extraphoto" path="" class="form-control"/>
											<br />
										</div>
<%-- 										<form:radiobuttons path="launchedState" items="${launchedMap}" /> --%>
<%-- 										<form:errors path="launchedState" /><br> --%>
										<p>
											<span>* </span><label for="content">選擇產品上下架狀態 :</label>
										</p>
										<div class="form-check form-check-inline" id="form-check-inline">
		                    				<form:radiobutton path="launchedState" class="form-check-input" name="" id="" value="1"/>
		                    				<label class="form-check-label" for="inlineRadio1">上架</label>
		                  				</div>
		                  				<div class="form-check form-check-inline">
		                    				<form:radiobutton path="launchedState" class="form-check-input" name="" id="offshelf" value="0"/>
		                    				<label class="form-check-label" for="inlineRadio2">下架</label>
		                  				</div>
										<input class="btn btn-primary" type="submit" value="送出" id="submit" />
										<a href="${contextRoot}/shop/allproducts"><input
											type="button" value="取消" class="btn btn-outline-warning" /></a>
									</form:form>

								</div>
							</div>
						</div>
					</div>
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
        addinput.setAttribute("class", "form-control");
        i++;
        dadtd.appendChild(addinput);
        dadtd.appendChild(addbr);
      });

      // 標籤格式確認
      // binding
      document.getElementById("descrp").addEventListener("blur", checkDesc); // 產品描述
      document.getElementById("proname").addEventListener("blur", checkName); // 產品名稱
      document
        .getElementById("category")
        .addEventListener("blur", checkCategory); // 產品類別
      document.getElementById("content").addEventListener("blur", checkContent); // 產品規格
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

      // Product description check effect
      let flag1 = true;
      function checkDesc() {
        let theIdObj = document.getElementById("descrp");
        let theIdObjVal = theIdObj.value;
        let spError = document.getElementById("descterror");
        let spCorrect = document.getElementById("desccorrect");
        let theIdObjValLen = theIdObjVal.length;
        if (theIdObjValLen == "") {
          spError.innerHTML = "欄位不可空白";
          spCorrect.innerHTML = "";
          flag1 = true;
        } else {
          spError.innerHTML = "";
          spCorrect.innerHTML = "格式正確 <img src='${contextRoot}/img/correct.png'>";
          flag1 = false;
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
          nCorrect.innerHTML = "格式正確 <img src='${contextRoot}/img/correct.png'>";
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
          catgCorrect.innerHTML = "格式正確 <img src='${contextRoot}/img/correct.png'>";
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
          contentCorrect.innerHTML = "格式正確 <img src='${contextRoot}/img/correct.png'>";
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
              priCorrect.innerHTML = "格式正確 <img src='${contextRoot}/img/correct.png'>";
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
            dsCorrect.innerHTML = "格式正確 <img src='${contextRoot}/img/correct.png'>";
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

      // Demo時自動填入資訊
      document.getElementById('demoBtn').addEventListener('click',function(){
        document.getElementById('descrp').value = '萬眾矚目的[史達巴克斯咖啡館]鎮店之寶之一的巧克力磚隆重上市！授權本商鋪網路獨家專賣，你各位還不手刀搶起來！現在購買享折扣85折！';
        document.getElementById('proname').value = '[特選]史達巴克斯咖啡館巧克力磚';
        document.getElementById('category').value = '美味嚐點';
        document.getElementById('content').value = '巧克力磚乙入( 20cm x 15 cm x 10 cm)';
        document.getElementById('unitprice').value = '550';
        document.getElementById('discount').value = '0.85';
        document.getElementById('launchdate').value = '2023-05-18';
        document.getElementById('offshelf').checked = true;
        
        // 格式確認
        checkDesc();
  	  	checkName();
  	  	checkCategory();
  	  	checkContent();
  	  	checkUniprice();
  	  	checkDiscount();
  	  	checkDate();


      })


    </script>
</body>
</html>


