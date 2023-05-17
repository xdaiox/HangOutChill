<%--
  Created by IntelliJ IDEA.
  User: RAY
  Date: 2023/4/23
  Time: 下午 02:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <jsp:include page="../../layout/navbar.jsp"/>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="UTF-8">
    <title>該地點名稱</title>

    <style>
        figure {
            width: 300px;
            height: 200px;
            overflow: hidden;
            background-color: #000;
            float: left;
            display: inline-block;
            margin-bottom: 30px;
            margin-right: 30px;
        }

        figure img {
            width: 100%;
        }

    </style>


</head>

<body>

<!--================所有內容 開始 =================-->
<section class="blog_area area-padding">
    <div class="container">
        <div class="row justify-content-center">


            <!--================左區 開始 =================-->
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="blog_left_sidebar">


                    <!--================左1 標題區 開始 =================-->
                    <article class="blog_item">
                        <div class="blog_details" style="background-color: white ; height:250px">
                            <figure style="height:180px">
                                <img width="300" height="178px"
                                     src="${contextRoot}/locationInfo/getImgCover/${locationInfo.locId}"/>
                            </figure>

                            <div>
                                <h2 style="color: black;">${locationInfo.locName}</h2>
                            </div>

                            <div>
                                <h4 style="display: inline; margin-right: 20px;">${locationInfo.locCat}</h4>
                                <h4 style="display: inline; margin-right: 20px;">${locationInfo.locPriceLevel}</h4>
                                <br>
                                <h5 style="display: inline; margin-right: 5px;">${locationInfo.locCity}</h5>
                                <h5 style="display: inline; margin-right: 5px;">${locationInfo.locDist}</h5>
                            </div>

                        </div>
                    </article>
                    <!--================左1 標題區 結束 =================-->


                    <!--================左2 簡介 開始=================-->
                    <article class="blog_item" style="background-color: white">


                        <div class="blog_details" style="background-color: white ; height:200px">
                            <div>
                                <h3 style="color: black;">簡介</h3>
                            </div>

                            <div>
                                <p>${locationInfo.locDesc}</p>
                            </div>
                        </div>
                    </article>
                    <!--================左2 簡介 結束=================-->


                    <!--================左3 精選圖片 開始 =================-->
                    <article class="blog_item" style="background-color: white">
                        <div class="blog_details" style="background-color: white; height: 950px">
                            <div>
                                <h3 style="color: black;">精選圖片</h3>
                            </div>

                            <div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; height: 100%;">
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG1/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;" alt="Image 1">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG2/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;" alt="Image 2">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG3/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 3">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG4/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 4">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG5/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 5">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG6/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 6">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG7/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 7">
                                </div>
                                <div style="width: 300px; height: 178px; margin: 10px;">
                                    <img src="${contextRoot}/locationInfo/getImgG8/${locationInfo.locId}"
                                         style="width: 100%; height: 100%; object-fit: contain;"
                                         alt="Image 8">
                                </div>
                            </div>
                        </div>
                    </article>
                    <!--================左3 精選圖片 結束 =================-->


                    <!--================左4 保留區 =================-->
<%--                    <article class="blog_item" style="background-color: white">--%>
<%--                        <div class="blog_details">--%>
<%--                            <a class="d-inline-block" href="single-blog.html">--%>
<%--                                <h2>Google inks pact for new 35-storey office</h2>--%>
<%--                            </a>--%>
<%--                            <p>That dominion stars lights dominion divide years for fourth have don't stars is that he--%>
<%--                                earth it first without heaven in place seed it second morning saying.</p>--%>
<%--                            <ul class="blog-info-link">--%>
<%--                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>--%>
<%--                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </article>--%>
                    <!--================左4 保留區 結束 =================-->


                </div>
            </div>
            <!--================左區 結束 =================-->


            <!--================右區 開始 =================-->
            <div class="col-lg-3">
                <div class="blog_right_sidebar">


                    <!--================右1 收藏 開始=================-->
                    <aside class="single_sidebar_widget search_widget">
                        <div class="form-group">
                            <div class="input-group" style="margin-bottom: 0;" id="favorite">
                                <%--                                    <input type="button" id="submitBtnSearch"--%>
                                <%--                                           class="button rounded-0 primary-bg text-white w-100"--%>
                                <%--                                           value="收藏" style="border: 1px solid #744FC6; background:#744FC6 " />--%>
                            </div>
                        </div>

                    </aside>
                    <!--================右1 收藏 結束=================-->


                    <!--================右2 google map Api  開始=================-->
                    <div class="single_sidebar_widget post_category_widget">
                        <div class="d-none d-sm-block mb-0 pb-4">
                            <div id="map" style="height: 300px;"></div>

                            <script>
                                function initMap() {
                                    var address = "${locationInfo.locCity}${locationInfo.locDist}${locationInfo.locAdd}";
                                    var locationName = "${locationInfo.locName}";

                                    var geocoder = new google.maps.Geocoder();
                                    geocoder.geocode({address: address}, function (results, status) {
                                        if (status === "OK") {
                                            var location = results[0].geometry.location;

                                            var lightStyles = [
                                                {
                                                    featureType: "all",
                                                    elementType: "all",
                                                    stylers: [
                                                        {visibility: "on"},
                                                        {lightness: 60}
                                                    ]
                                                }
                                            ];
                                            var map = new google.maps.Map(document.getElementById('map'), {
                                                center: {lat: location.lat(), lng: location.lng()},
                                                zoom: 18,
                                                styles: null,
                                                scrollwheel: true
                                            });

                                            // 创建标记对象并放置在地图上
                                            var marker = new google.maps.Marker({
                                                position: location,
                                                map: map,
                                                title: locationName
                                            });

                                            // 创建信息窗口以显示自定义名称
                                            var infoWindow = new google.maps.InfoWindow({
                                                content: "<div style='font-size: 20px; font-weight: bold; color: purple'>" + locationName + "</div>"
                                            });

                                            // 在标记对象上添加点击事件，以打开信息窗口
                                            infoWindow.open(map, marker);


                                        } else {
                                            console.log("Geocode was not successful for the following reason: " + status);
                                        }
                                    });
                                }
                            </script>
                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDjQq4LVwcLXI5PoGsgZ8X41SW9oeEg1vk&callback=initMap"></script>
                        </div>
                    </div>
                    <!--================右2 google map Api  結束=================-->


                    <!--================右3 資訊 開始 =================-->
                    <aside class="single_sidebar_widget post_category_widget" STYLE="word-wrap: break-word;" >
                        <h4 class="widget_title">資訊</h4>
                        <ul class="list cat-list">
                            <li><span
                                    class="d-flex">地址： ${locationInfo.locCity}${locationInfo.locDist}${locationInfo.locAdd} </span>
                            </li>
                            <li><span class="d-flex">電話： ${locationInfo.locTel}</span></li>
                            <li>Link： <a href="${locationInfo.locLink}" style="display: block;" >${locationInfo.locLink}</a></li>
                        </ul>
                    </aside>
                    <!--================右3 資訊 結束 =================-->


                    <!--================右4 營業時間 開始 =================-->
                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">營業時間</h4>
                        <ul class="list cat-list">
                            <li><span class="d-flex">星期一： <jstl:if
                                    test="${locationInfo.locationOperationTime.mondayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.mondayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.mondayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.mondayClose}" pattern="HH:mm"/></span>
                            </li>
                            <li><span class="d-flex">星期二： <jstl:if
                                    test="${locationInfo.locationOperationTime.tuesdayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.tuesdayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.tuesdayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.tuesdayClose}" pattern="HH:mm"/></span>
                            </li>
                            <li><span class="d-flex">星期三： <jstl:if
                                    test="${locationInfo.locationOperationTime.wednesdayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.wednesdayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.wednesdayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.wednesdayClose}"
                                    pattern="HH:mm"/></span></li>
                            <li><span class="d-flex">星期四： <jstl:if
                                    test="${locationInfo.locationOperationTime.thursdayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.thursdayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.thursdayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.thursdayClose}" pattern="HH:mm"/></span>
                            </li>
                            <li><span class="d-flex">星期五： <jstl:if
                                    test="${locationInfo.locationOperationTime.fridayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.fridayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.fridayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.fridayClose}" pattern="HH:mm"/></span>
                            </li>
                            <li><span class="d-flex">星期六： <jstl:if
                                    test="${locationInfo.locationOperationTime.saturdayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.saturdayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.saturdayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.saturdayClose}" pattern="HH:mm"/></span>
                            </li>
                            <li><span class="d-flex">星期日： <jstl:if
                                    test="${locationInfo.locationOperationTime.sundayOpen == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.sundayOpen}"
                                    pattern="HH:mm"/> - <jstl:if
                                    test="${locationInfo.locationOperationTime.sundayClose == null}">無營業</jstl:if><fmt:formatDate
                                    value="${locationInfo.locationOperationTime.sundayClose}" pattern="HH:mm"/></span>
                            </li>
                        </ul>
                    </aside>
                    <!--================右4 營業時間 結束 =================-->


                    <!--================右區 結束 =================-->


                </div>
            </div>
        </div>
    </div>
</section>
<!--================所有內容 結束=================-->


<jsp:include page="../../layout/footer.jsp"/>
<script>
    let favorite = document.getElementById("favorite");
    let favoriteStyle = "";

    window.addEventListener("load", loaded);

    function loaded() {
        axios.get("${contextRoot}/normalMember/findFavoriteExisted?locId=" +${locationInfo.locId})
            .then((res) => {
                if (res.data) {
                    favoriteStyle += ' <input type="button" id="submitBtnSearch"class="button rounded-0 primary-bg text-white w-100"value="取消收藏" style="border: 1px solid #744FC6; background:#744FC6 " onclick="deleteFavorite()"/>'
                } else {
                    favoriteStyle += ' <input type="button" id="submitBtnSearch"class="button rounded-0 primary-bg text-white w-100"value="加入收藏" style="border: 1px solid #744FC6; background:#744FC6 " onclick="addFavorite()"/>'
                }
                favorite.innerHTML = favoriteStyle
            }).catch((err) => {
            alert(err)
        })
    }

    function deleteFavorite() {
        axios.delete("${contextRoot}/normalMenber/deleteFavoriteLocationBySingle?locId=" +${locationInfo.locId})
            .then((response) => {
                if (response.data) {
                    favoriteStyle = ""
                    favorite.innerHTML = favoriteStyle
                    favoriteStyle += ' <input type="button" id="submitBtnSearch"class="button rounded-0 primary-bg text-white w-100"value="加入收藏" style="border: 1px solid #744FC6; background:#744FC6 " onclick="addFavorite()"/>'
                }
                favorite.innerHTML = favoriteStyle
            }).catch((error) => {
            alert(error)
        })
    }

    function addFavorite() {
        axios.post("${contextRoot}/normalMember/addFavoriteLocation?locationInfoId=" +${locationInfo.locId})
            .then((resp) => {
                if (resp.data) {
                    favoriteStyle = ""
                    favorite.innerHTML = favoriteStyle
                    favoriteStyle += ' <input type="button" id="submitBtnSearch"class="button rounded-0 primary-bg text-white w-100"value="取消收藏" style="border: 1px solid #744FC6; background:#744FC6 " onclick="deleteFavorite()"/>'
                }
                favorite.innerHTML = favoriteStyle
            }).catch((errr) => {
            alert(errr)
        })
    }
</script>


</body>
</html>
