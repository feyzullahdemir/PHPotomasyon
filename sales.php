<?php
require_once 'header.php';
require_once 'sidebar.php';

?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->



  <section class="content">


   <?php

   if (isset($_GET['salesInsert'])) {?>
    <div class="box box-primary">



      <div class="content-header">
        <h1 >Satış Ekle</h1>
        <hr>
      </div>

      <div class="box-body">

        <?php
        if (isset($_POST['sales_insert'])) {

         $sonuc=$db->insert("sales",$_POST,[
          "form_name" => "sales_insert"
        ]
      );

      if ($sonuc['status']) {?>
       <div class="alert alert-success">
         Kayıt Başarılı <a href="<?php $link=explode("?",$_SERVER['REQUEST_URI']); echo $link[0]; ?>">Listele</a>
       </div>
     <?php } else {?>

      <div class="alert alert-danger">
       Kayıt Başarısız.<?php echo $sonuc['error'] ?>
     </div>
   <?php }
 }
 ?>


      <!--  <div class="alert alert-success">
        Kayıt Başarılı
      </div> -->


      <form method="POST" enctype="multipart/form-data">


        <div class="form-group">
          <label>Hesap Seç</label>
          <div class="row">
            <div class="col-xs-12">
              <select class="form-control" name="account_id">


                <?php
                $sql=$db->read("account", [
                  "colums_name"=> "account_id",
                  "colums_sort"=> "DESC"
                ]);
                $say=1;
                while ($row=$sql->fetch(PDO::FETCH_ASSOC)) { ?>
                    <option value="<?php echo $row['account_id'] ?>"> <?php echo $row['account_company'] ?></option>
                  // code...
              <?php  }?>


                 ?>

              </select>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label>Ürün Seç</label>
          <div class="row">
            <div class="col-xs-12">
              <select class="form-control" name="products_id">


                <?php
                $sql=$db->read("products", [
                  "colums_name"=> "products_id",
                  "colums_sort"=> "DESC"
                ]);
                $say=1;
                while ($row=$sql->fetch(PDO::FETCH_ASSOC)) { ?>
                    <option value="<?php echo $row['products_id'] ?>"> <?php echo $row['products_title'] ?></option>
                  // code...
              <?php  }?>


                 ?>

              </select>
            </div>
          </div>
        </div>



        <div align="right" class="box-footer">
          <button type="submit" class="btn btn-success" name="sales_insert">Ekle</button>
        </div>



      </form>
    </div>

  </div>
<?php }

$sql=$db->wread("sales","sales_id",$_GET['sales_id']);
$row=$sql->fetch(PDO::FETCH_ASSOC);



?>

<!-- update işlem sorgusu -->








<!-- Default box -->
<div class="box box-primary">

 <div class="content-header">
  <h1 >satışlar</h1>
  <div align="right">
    <a href="?salesInsert=true"><button class="btn btn-success">Yeni Ekle</button></a>
    <br><br>
  </div>
  <?php
  if (isset($_GET['salesDelete'])) {

   $sonuc=$db->delete("sales","sales_id",$_GET['sales_id'],$_GET['file_delete']);


   if ($sonuc['status']) {?>
     <div class="alert alert-success">
       Silme Başarılı
     </div>
   <?php } else {?>

    <div class="alert alert-danger ">
     Silme Başarısız.<?php echo $sonuc['error'] ?>
   </div>
 <?php }
}
?>
</div>
<!-- /.box-header -->
<div class="box-body">
  <table id="example1" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th align="center" width="5">#</th>
        <th>Tarih</th>
        <th>Ürün , Hizmet</th>
        <th>Hesap</th>
        <th>Tutar</th>

        <th></th>
      </tr>
    </thead>
    <tbody>

      <?php
      $sql=$db->qSql("SELECT * FROM sales INNER JOIN account ON account.account_id=sales.account_id INNER JOIN products ON products.products_id=sales.products_id");
      $say=1;
      while ($row=$sql->fetch(PDO::FETCH_ASSOC)) {  ?>

        <tr>
          <td><?php echo $say++; ?></td>
          <td width="150"><?php echo $db->tDate($row['sales_date'],["date_time" => TRUE]) ?></td>
          <td><?php echo $row['products_title'] ?></td>
          <td><?php echo $row['account_company'] ?></td>
          <td width="20"><a href="sales-details.php?sales_id=<?php echo $row['sales_id']; ?>"><button class="btn btn-primary btn-sm">satış Detayı</button></a></td>
          <td align="center" width="5"><a href="?salesDelete=True&sales_id=<?php echo $row['sales_id'] ?>&file_delete=<?php echo $row['sales_file'] ?>"><i class="fa fa-trash-o"></i></a></td>
        </tr>

      <?php } ?>

    </table>

  </div>
  <!-- /.box-body -->
</div>

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<?php require_once 'footer.php'; ?>
