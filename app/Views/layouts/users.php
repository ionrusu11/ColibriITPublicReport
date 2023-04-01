<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?= $title ?? "" ?></title>
    <link rel="stylesheet" href="<?= base_url('assets/admin/vendor/bootstrap/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?= base_url('assets/admin/vendor/fonts/circular-std/style.css'); ?>">
    <link rel="stylesheet" href="<?= base_url('assets/admin/vendor/fonts/fontawesome/css/fontawesome-all.css'); ?>">

</head>
<body>

<?= $this->renderSection('content') ;?>
</body>
</html>