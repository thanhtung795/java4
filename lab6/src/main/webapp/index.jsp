<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Interactive Interface</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container">
        <div class="row mb-5">
            <div class="col-12">
                <h1 class="title text-center">Bài 2</h1>
                <div class="row g-2">
                    <div class="col-6">
                        <a href="UserIdServlet" class="btn-custom btn-user-id">User Id</a>
                    </div>
                    <div class="col-6">
                        <a href="TitleVideoServlet" class="btn-custom btn-title">Title</a>
                    </div>
                    <div class="col-6">
                        <a href="VideoIdSServler" class="btn-custom btn-video-id">Video Id</a>
                    </div>
                    <div class="col-6">
                        <a href="FavoriteServlet" class="btn-custom btn-favorite">Favorite</a>
                    </div>
                    <div class="col-12">
                        <a href="ReportServler" class="btn-custom btn-report">Report</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-12">
                <h1 class="title text-center">Bài 3</h1>
                <div class="row g-2">
                    <div class="col-6">
                        <a href="UserIdServlet" class="btn-custom btn-user-id">User Id</a>
                    </div>
                    <div class="col-6">
                        <a href="favoriteTitleVideo" class="btn-custom btn-title">Title</a>
                    </div>
                    <div class="col-6">
                        <a href="favoriteVideoTime" class="btn-custom btn-video-id">Video Id</a>
                    </div>
                    <div class="col-6">
                        <a href="findVideoMonth" class="btn-custom btn-favorite">Favorite</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-12">
                <h1 class="title text-center">Bài 4</h1>
                <div class="row g-2">
                    <div class="col-6">
                        <a href="RandomVideoServlet" class="btn-custom btn-random-video">Random video</a>
                    </div>
                    <div class="col-6">
                        <a href="YearVideoServlet" class="btn-custom btn-year-video">Year video</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
