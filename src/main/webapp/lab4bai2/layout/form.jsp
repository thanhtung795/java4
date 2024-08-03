<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container-fluid mt-4">
	<div class="row">
		<div class="col-md-12 w-100">
			<form action="lab3bai3" method="post">
				<div class="card-group mb-0">
					<div class="card p-4 bg-light">
						<div class="card-body ">
							<h1>Create User</h1>
							<div class="input-group mb-3">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" name="username"
									value="${form.username}" placeholder="Username">
							</div>
							<div class="input-group mb-4">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="password"
									value="${password}" placeholder="Password">
							</div>
							<input class="mb-4" name="remember" type="checkbox"
								${form.remember ? 'checked' : ''}> Remember me?
							<div class="row">
								<div class="col-6">
									<button type="submit" class="btn btn-primary px-4">Create</button>
								</div>
								<div class="col-6 text-right">
								</div>
							</div>
						</div>
					</div>
					<div class="card text-white bg-primary py-5 d-md-down-none"
						style="width: 44%">
						<div class="card-body text-center">
							<div>
								<h1 class="mt-5">${message}</h1>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
