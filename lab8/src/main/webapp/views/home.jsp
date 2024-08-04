<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
  <div class="card overflow-hidden">
    <div class="card-body p-0">
      <img src="https://apolyorg.wordpress.com/wp-content/uploads/2019/04/xbanner-trang-lien-he-moi.jpg.pagespeed.ic_.fqvwhe7pcx.jpg" alt="" class="img-fluid">
      <div class="row align-items-center">
        <div class="col-lg-4 order-lg-1 order-2">
          <div class="d-flex align-items-center justify-content-around m-4">
            <div class="text-center">
              <i class="fa fa-file fs-6 d-block mb-2"></i>
              <h4 class="mb-0 fw-semibold lh-1">938</h4>
              <p class="mb-0 fs-4">Posts</p>
            </div>
            <div class="text-center">
              <i class="fa fa-user fs-6 d-block mb-2"></i>
              <h4 class="mb-0 fw-semibold lh-1">3,586</h4>
              <p class="mb-0 fs-4">Followers</p>
            </div>
            <div class="text-center">
              <i class="fa fa-check fs-6 d-block mb-2"></i>
              <h4 class="mb-0 fw-semibold lh-1">2,659</h4>
              <p class="mb-0 fs-4">Following</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mt-n3 order-lg-2 order-1">
          <div class="mt-n5">
            <div class="d-flex align-items-center justify-content-center mb-2">
              <div class="linear-gradient d-flex align-items-center justify-content-center rounded-circle" style="width: 110px; height: 110px;" ;="">
                <div class="border border-4 border-white d-flex align-items-center justify-content-center rounded-circle overflow-hidden" style="width: 100px; height: 100px;" ;="">
                  <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="w-100 h-100">
                </div>
              </div>
            </div>
            <div class="text-center">
              <h5 class="fs-5 mb-0 fw-semibold">Mathew Anderson</h5>
              <p class="mb-0 fs-4">Designer</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 order-last">
          <ul class="list-unstyled d-flex align-items-center justify-content-center justify-content-lg-start my-3 gap-3">
            <li class="position-relative">
              <a class="text-white d-flex align-items-center justify-content-center bg-primary p-2 fs-4 rounded-circle" href="javascript:void(0)" width="30" height="30">
                <i class="fa fa-facebook"></i>
              </a>
            </li>
            <li class="position-relative">
              <a class="text-white bg-secondary d-flex align-items-center justify-content-center p-2 fs-4 rounded-circle " href="javascript:void(0)">
                <i class="fa fa-twitter"></i>
              </a>
            </li>
            <li class="position-relative">
              <a class="text-white bg-secondary d-flex align-items-center justify-content-center p-2 fs-4 rounded-circle " href="javascript:void(0)">
                <i class="fa fa-dribbble"></i>
              </a>
            </li>
            <li class="position-relative">
              <a class="text-white bg-danger d-flex align-items-center justify-content-center p-2 fs-4 rounded-circle " href="javascript:void(0)">
                <i class="fa fa-youtube"></i>
              </a>
            </li>
            <li><button class="btn btn-primary">Add To Story</button></li>
          </ul>
        </div>
      </div>
      <ul class="nav nav-pills user-profile-tab justify-content-end mt-2 bg-light-info rounded-2" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="true">
            <i class="fa fa-user me-2 fs-6"></i>
            <span class="d-none d-md-block">Profile</span> 
          </button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-followers-tab" data-bs-toggle="pill" data-bs-target="#pills-followers" type="button" role="tab" aria-controls="pills-followers" aria-selected="false" tabindex="-1">
            <i class="fa fa-heart me-2 fs-6"></i>
            <span class="d-none d-md-block">Followers</span> 
          </button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-friends-tab" data-bs-toggle="pill" data-bs-target="#pills-friends" type="button" role="tab" aria-controls="pills-friends" aria-selected="false" tabindex="-1">
            <i class="fa fa-users me-2 fs-6"></i>
            <span class="d-none d-md-block">Friends</span> 
          </button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-gallery-tab" data-bs-toggle="pill" data-bs-target="#pills-gallery" type="button" role="tab" aria-controls="pills-gallery" aria-selected="false" tabindex="-1">
            <i class="fa fa-photo me-2 fs-6"></i>
            <span class="d-none d-md-block">Gallery</span> 
          </button>
        </li>
      </ul>
    </div>
  </div>
  <div class="tab-content" id="pills-tabContent">
    
    <div class="tab-pane fade show active" id="pills-friends" role="tabpanel" aria-labelledby="pills-friends-tab" tabindex="0">
      <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
        <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">Friends <span class="badge text-bg-secondary fs-2 rounded-4 py-1 px-2 ms-2">20</span></h3>
        <form class="position-relative">
          <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh" placeholder="Search Friends">
          <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y text-dark ms-3"></i>
        </form>
      </div>
      <div class="row">
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Betty Adams</h5>
              <span class="text-dark fs-2">Medical Secretary</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Inez Lyons</h5>
              <span class="text-dark fs-2">Medical Technician</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Lydia Bryan</h5>
              <span class="text-dark fs-2">Preschool Teacher</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Carolyn Bryant</h5>
              <span class="text-dark fs-2">Legal Secretary</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Paul Benson</h5>
              <span class="text-dark fs-2">Safety Engineer</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Robert Francis</h5>
              <span class="text-dark fs-2">Nursing Administrator</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Billy Rogers</h5>
              <span class="text-dark fs-2">Legal Secretary</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Rosetta Brewer</h5>
              <span class="text-dark fs-2">Comptroller</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Patrick Knight</h5>
              <span class="text-dark fs-2">Retail Store Manager</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Francis Sutton</h5>
              <span class="text-dark fs-2">Astronomer</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Bernice Henry</h5>
              <span class="text-dark fs-2">Security Consultant</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Estella Garcia</h5>
              <span class="text-dark fs-2">Lead Software Test Engineer</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Norman Moran</h5>
              <span class="text-dark fs-2">Engineer Technician</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Jessie Matthews</h5>
              <span class="text-dark fs-2">Lead Software Engineer</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Elijah Perez</h5>
              <span class="text-dark fs-2">Special Education Teacher</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Robert Martin</h5>
              <span class="text-dark fs-2">Transportation Manager</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Elva Wong</h5>
              <span class="text-dark fs-2">Logistics Manager</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Edith Taylor</h5>
              <span class="text-dark fs-2">Union Representative</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Violet Jackson</h5>
              <span class="text-dark fs-2">Agricultural Inspector</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="card hover-img">
            <div class="card-body p-4 text-center border-bottom">
              <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="rounded-circle mb-3" width="80" height="80">
              <h5 class="fw-semibold mb-0">Phoebe Owens</h5>
              <span class="text-dark fs-2">Safety Engineer</span>
            </div>
            <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
              <li class="position-relative">
                <a class="text-primary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold" href="javascript:void(0)">
                  <i class="ti ti-brand-facebook"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-danger d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-instagram"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-info d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-github"></i>
                </a>
              </li>
              <li class="position-relative">
                <a class="text-secondary d-flex align-items-center justify-content-center p-2 fs-5 rounded-circle fw-semibold " href="javascript:void(0)">
                  <i class="ti ti-brand-twitter"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
   
  </div>
</div>