<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<?= base_url('assets/admin/vendor/bootstrap/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?= base_url('assets/admin/vendor/fonts/circular-std/style.css'); ?>">
    <link rel="stylesheet" href="<?= base_url('assets/admin/libs/css/style.css') ?>">
    <link rel="stylesheet" href="<?= base_url('assets/admin/vendor/fonts/fontawesome/css/fontawesome-all.css'); ?>">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
        }
    </style>
</head>

<body>
<!-- ============================================================== -->
<!-- login page  -->
<!-- ============================================================== -->
<div class="splash-container">
    <div class="card ">
        <div class="card-header text-center"><a href="<?= base_url('/')?>"><img class="logo-img" src="<?= base_url('assets/admin/images/logo.png')?>" alt="logo"></a><span class="splash-description">Please enter your user information.</span></div>
        <div class="card-body">
            <form method="post" action="<?= base_url('auth/check'); ?>">
                <?= csrf_field()?>

                <?php if (!empty(session()->getFlashdata('fail'))) : ?>
                    <div class="alert alert-danger"> <?= session()->getFlashdata('fail'); ?> </div>
                <?php endif?>

                <?php if (!empty(session()->getFlashdata('success'))) : ?>
                    <div class="alert alert-success"> <?= session()->getFlashdata('success'); ?> </div>
                <?php endif?>

                <div class="form-group">
                    <input class="form-control form-control-lg" name="username" id="username" type="text" placeholder="Username" autocomplete="off">
                    <span class="text-danger" role="alert"><?= isset($validation) ? display_error($validation,'username'): ''; ?></span>
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" name="password" id="password" type="password" placeholder="Password">
                    <span class="text-danger" role="alert"><?= isset($validation) ? display_error($validation,'password'): ''; ?></span>
                </div>
<!--                <div class="form-group">-->
<!--                    <label class="custom-control custom-checkbox">-->
<!--                        <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>-->
<!--                    </label>-->
<!--                </div>-->
                <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
            </form>
        </div>
<!--        <div class="card-footer bg-white p-0  ">-->
<!--            <div class="card-footer-item card-footer-item-bordered">-->
<!--                <a href="#" class="footer-link">Create An Account</a></div>-->
<!--            <div class="card-footer-item card-footer-item-bordered">-->
<!--                <a href="#" class="footer-link">Forgot Password</a>-->
<!--            </div>-->
<!--        </div>-->
    </div>
</div>

<!-- ============================================================== -->
<!-- end login page  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="<?= base_url('assets/admin/vendor/jquery/jquery-3.3.1.min.js');?>"></script>
<!-- bootstap bundle js -->
<script src="<?= base_url('assets/admin/vendor/bootstrap/js/bootstrap.bundle.js');?>"></script>
</body>

</html>

