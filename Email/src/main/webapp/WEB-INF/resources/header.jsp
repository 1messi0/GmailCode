<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<body>
   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div class="border-end bg-white" id="sidebar-wrapper">
         <div class="sidebar-heading border-bottom bg-light">플로리츠</div>
         <div class="list-group list-group-flush">
            <a class="list-group-item" href="#!">로그인</a> <a
               class="list-group-item" href="/List">목록</a> <a
               class="list-group-item" href="/WriteForm">글쓰기</a> <a
               class="list-group-item" href="#!">Events</a> <a
               class="list-group-item" href="#!">Profile</a> <a
               class="list-group-item" href="#!">Status</a>
         </div>
      </div>
      <!-- Page content wrapper-->
      <div id="page-content-wrapper">
         <!-- Top navigation-->
         <nav
            class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <div class="container-fluid">
               <button class="navbar-toggler" type="button"
                  data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent" aria-expanded="false"
                  aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                     <li class="nav-item active"><a class="nav-link" href="/">Floritz</a></li>
                     <button class="btn btn-light" id="sidebarToggle">
                        <i class="bi bi-justify" style="font-size: 30px;"></i>
                     </button>
                  </ul>
               </div>
            </div>
         </nav>
      </div>
   </div>
</body>
</html>


