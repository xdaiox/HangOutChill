# Spring Boot Project - HangOutChill
本網站的設置著力於推廣夜生活及休閒生活安排，提供整合後資訊與多元網站服務！

## 網站架構
* 會員中心
* 專欄
* 精選地點
* 討論區
* 活動與實體課程
* 購物中心

## 系統環境
* Java 11
* Spring Boot v2.7.10 (framework) 
* Jpa/Hibernate (ORM)
* SQL Server 2019/2022 (Database)

## 建置作業
1. 將本專案 clone 至本機電腦
2. 以 Java IDE 將其以 Maven 專案匯入 (import) ，並更新此專案 (Update Maven Project) 以利專案啟動時能順利進行
3. 設定 src/main/resources/application.properties 檔裡適當的連線字串 (下方文字xxx處)

```
## datasource
spring.datasource.driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver
spring.datasource.url=xxx
spring.datasource.username=xxx
spring.datasource.password=xxx
```

4. 執行 HangoutchillApplication.java 檔，若 console 中出現以下字串則代表順利啟動專案

```
Started HangoutchillApplication in xxx seconds (JVM running for xxx)
```

5. 網址列中輸入 http://localhost:8080/hangoutchill/ 即可進入 HangoutChill 首頁

