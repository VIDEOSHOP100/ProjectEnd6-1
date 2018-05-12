<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">

  </head>

  <body>

    <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">404
        <small>Page Not Found</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">404</li>
      </ol>

      <div class="jumbotron">
        <h1 class="display-1">404</h1>
        <p>The page you're looking for could not be found. Here are some helpful links to get you back on track:</p>
        <ul>
          <li>
            <a href="index.html">Home</a>
          </li>
          <li>
            <a href="about.html">About</a>
          </li>
          <li>
            <a href="services.html">Services</a>
          </li>
          <li>
            <a href="contact.html">Contact</a>
          </li>
          <li>
            Portfolio
            <ul>
              <li>
                <a href="portfolio-1-col.html">1 Column Portfolio</a>
              </li>
              <li>
                <a href="portfolio-2-col.html">2 Column Portfolio</a>
              </li>
              <li>
                <a href="portfolio-3-col.html">3 Column Portfolio</a>
              </li>
              <li>
                <a href="portfolio-4-col.html">4 Column Portfolio</a>
              </li>
            </ul>
          </li>
          <li>
            Blog
            <ul>
              <li>
                <a href="blog-home-1.html">Blog Home 1</a>
              </li>
              <li>
                <a href="blog-home-2.html">Blog Home 2</a>
              </li>
              <li>
                <a href="blog-post.html">Blog Post</a>
              </li>
            </ul>
          </li>
          <li>
            Other Pages
            <ul>
              <li>
                <a href="full-width-page.html">Full Width Page</a>
              </li>
              <li>
                <a href="sidebar.html">Sidebar Page</a>
              </li>
              <li>
                <a href="faq.html">FAQ</a>
              </li>
              <li>
                <a href="404.html">404 Page</a>
              </li>
              <li>
                <a href="pricing-table.html">Pricing Table</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.jumbotron -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/global/vendor/jquery/jquery.min.js'/> "></script>
	<script src="<c:url value='/global/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>

  </body>
</html>