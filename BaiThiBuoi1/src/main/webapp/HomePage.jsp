<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
body {
	margin-top: 20px;
	background: #f8f8f8
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row flex-lg-nowrap">
			<div class="col-12 col-lg-auto mb-3" style="width: 200px;">
				<div class="card p-3">
					<div class="e-navlist e-navlist--active-bg">
						<ul class="nav">
							<li class="nav-item"><a class="nav-link px-2 active"
								href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
							<li class="nav-item"><a class="nav-link px-2"
								href="${pageContext.request.contextPath}/user/UserCRUD"
								target="__blank"><i class="fa fa-fw fa-th mr-1"></i><span>CRUD</span></a></li>
							<li class="nav-item"><a class="nav-link px-2" href="#"
								target="__blank"><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="row">
					<div class="col mb-3">
						<div class="card">
							<div class="card-body">
								<div class="e-profile">
									<div class="row">
										<div class="col-12 col-sm-auto mb-3">
											<div class="mx-auto" style="width: 140px;">
												<div
													class="d-flex justify-content-center align-items-center rounded"
													style="height: 140px; background-color: rgb(233, 236, 239);">
													<span
														style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
												</div>
											</div>
										</div>
										<div
											class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
											<div class="text-center text-sm-left mb-2 mb-sm-0">
												<h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">John Smith</h4>
												<p class="mb-0">@johnny.s</p>
												<div class="text-muted">
													<small>Last seen 2 hours ago</small>
												</div>
												<div class="mt-2">
													<button class="btn btn-primary" type="button">
														<i class="fa fa-fw fa-camera"></i> <span>Change
															Photo</span>
													</button>
												</div>
											</div>
											<div class="text-center text-sm-right">
												<span class="badge badge-secondary">administrator</span>
												<div class="text-muted">
													<small>Joined 09 Dec 2017</small>
												</div>
											</div>
										</div>
									</div>
									<ul class="nav nav-tabs">
										<li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
									</ul>
									<div class="tab-content pt-3">
										<div class="tab-pane active">
											<form class="form" novalidate="">
												<div class="row">
													<div class="col">
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Full Name</label> <input class="form-control"
																		type="text" name="name" placeholder="John Smith"
																		value="John Smith">
																</div>
															</div>
															<div class="col">
																<div class="form-group">
																	<label>Username</label> <input class="form-control"
																		type="text" name="username" placeholder="johnny.s"
																		value="johnny.s">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Email</label> <input class="form-control"
																		type="text" placeholder="user@example.com">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col mb-3">
																<div class="form-group">
																	<label>About</label>
																	<textarea class="form-control" rows="5"
																		placeholder="My Bio"></textarea>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 mb-3">
														<div class="mb-2">
															<b>Change Password</b>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Current Password</label> <input
																		class="form-control" type="password"
																		placeholder="••••••">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>New Password</label> <input class="form-control"
																		type="password" placeholder="••••••">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col">
																<div class="form-group">
																	<label>Confirm <span class="d-none d-xl-inline">Password</span></label>
																	<input class="form-control" type="password"
																		placeholder="••••••">
																</div>
															</div>
														</div>
													</div>
													<div class="col-12 col-sm-5 offset-sm-1 mb-3">
														<div class="mb-2">
															<b>Keeping in Touch</b>
														</div>
														<div class="row">
															<div class="col">
																<label>Email Notifications</label>
																<div class="custom-controls-stacked px-2">
																	<div class="custom-control custom-checkbox">
																		<input type="checkbox" class="custom-control-input"
																			id="notifications-blog" checked=""> <label
																			class="custom-control-label" for="notifications-blog">Blog
																			posts</label>
																	</div>
																	<div class="custom-control custom-checkbox">
																		<input type="checkbox" class="custom-control-input"
																			id="notifications-news" checked=""> <label
																			class="custom-control-label" for="notifications-news">Newsletter</label>
																	</div>
																	<div class="custom-control custom-checkbox">
																		<input type="checkbox" class="custom-control-input"
																			id="notifications-offers" checked=""> <label
																			class="custom-control-label"
																			for="notifications-offers">Personal Offers</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col d-flex justify-content-end">
														<button class="btn btn-primary" type="submit">Save
															Changes</button>
													</div>
												</div>
											</form>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-3 mb-3">
						<div class="card mb-3">
							<div class="card-body">
								<div class="px-xl-3">
									<form method="post" action="logout">
										<button type="submit" formaction="logout"
											class="btn btn-block btn-secondary">
											<i class="fa fa-sign-out"></i> <span>Logout</span>
										</button>
									</form>

								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h6 class="card-title font-weight-bold">Support</h6>
								<p class="card-text">Get fast, free help from our friendly
									assistants.</p>
								<button type="button" class="btn btn-primary">Contact
									Us</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>