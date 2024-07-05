<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html ng-app="myApp">

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>

  <body>
    <%@include file="layout/header.jsp" %>
      <%@include file="layout/menu.jsp" %>
        <%@include file="layout/main.jsp" %>







          <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
          <script>
            let app = angular.module("myApp", []);
            app.controller("myCtrl", function ($scope) {
              $scope.products = [{
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              }, {
                "img": "img/SamSung.webp",
                "name": "SamSung",
                "price": "$299",
              },];
            });
          </script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous">
          </script>
  </body>

  </html>